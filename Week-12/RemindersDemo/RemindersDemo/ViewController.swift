//
//  ViewController.swift
//  RemindersDemo
//
//  Created by Dilum De Silva on 2021-04-24.
//

import UserNotifications
import UIKit

struct Reminder {
    let title: String
    let body: String
    let date: Date
    let identifier: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var remindersTable: UITableView!
    
    var reminders = [Reminder]()

    override func viewDidLoad() {
        super.viewDidLoad()
        remindersTable.delegate = self
        remindersTable.dataSource = self
        
    }
    
    @IBAction func didTapAddReminder() {
        guard let reminderVC = storyboard?.instantiateViewController(identifier: "add") as? AddReminderVC else {
            return
        }
        
        reminderVC.title = "New Reminder"
        reminderVC.navigationItem.largeTitleDisplayMode = .never
        reminderVC.completion = {title, body, date in
            DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
                let newReminder = Reminder(title: title,
                                           body: body,
                                           date: date,
                                           identifier: "id_\(title)")
                
                self.reminders.append(newReminder)
                self.remindersTable.reloadData()
                
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {success, error in
                    if success {
                        self.scheduleReminder(with: title,
                                              body,
                                              date,
                                              "id_\(title)")
                    } else if let err = error {
                        print("Permission error: \(err)")
                    }
                })
            }
        }
        navigationController?.pushViewController(reminderVC, animated: true)
    }
    
    @IBAction func didTapPlayReminder() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {success, error in
            if success {
                let targetDate = Date().addingTimeInterval(10)
                self.scheduleReminder(with: "Test Reminder",
                                      "Test Reminder Body",
                                      targetDate,
                                      "id")
            } else if let err = error {
                print("Permission error: \(err)")
            }
        })
    }
    
    private func scheduleReminder(with title: String,
                                  _ body: String,
                                  _ date: Date,
                                  _ id: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let notficationTrigger = UNCalendarNotificationTrigger(
            dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date),
            repeats: false)
        
        let notficationRequest = UNNotificationRequest(identifier: id,
                                                       content: content,
                                                       trigger: notficationTrigger)
        
        UNUserNotificationCenter.current().add(notficationRequest, withCompletionHandler: { error in
            if error != nil {
                print("NotificationCenter Error: \(error)")
            }
        })
    }
}

//MARK:- TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let date = reminders[indexPath.row].date
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, dd, YYYY"
        
        
        cell.textLabel?.text = reminders[indexPath.row].title
        cell.detailTextLabel?.text = formatter.string(from: date)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
