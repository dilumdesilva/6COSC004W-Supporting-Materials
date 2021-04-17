//
//  MainVC.swift
//  TuteWeek07
//
//  Created by Dilum De Silva on 2021-03-06.
//

import UIKit

class MainViewController: UIViewController {
    
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var datePickerOne: UIDatePicker!
    @IBOutlet weak var datePickerTwo: UIDatePicker!
    
    @IBOutlet weak var firstDateLabel: UILabel!
    @IBOutlet weak var seconDateLabel: UILabel!
    @IBOutlet weak var daysUntilLabel: UILabel!
    @IBOutlet weak var weeksAndDaysUntilLabel: UILabel!
    
    var localeEng = true
    
    override func viewDidLoad() {
        setupUI()
        
        datePickerOne.addTarget(self, action: #selector(datePickerValueUpdated), for: .valueChanged)
        
        datePickerTwo.addTarget(self, action: #selector(datePickerValueUpdated), for: .valueChanged)
    }

    private func setupUI() {
        datePickerOne?.preferredDatePickerStyle = .wheels
        setDate()
    }
    
    private func setDate(){
        datePickerOne.datePickerMode = .date
        let startDate = datePickerOne.date
        let endDate = datePickerTwo.date
        
        dateFormatter.setLocalizedDateFormatFromTemplate("dd MMM yyyy")
        let dateOneStr = dateFormatter.string(from: startDate as Date)
        print("Start Date: \(dateOneStr)")
        
        dateFormatter.setLocalizedDateFormatFromTemplate("dd MMM yyyy")
        let dateTwoStr = dateFormatter.string(from: endDate as Date)
        print("End Date: \(dateTwoStr)")
        
        let daysLeft = countDays(from: startDate, to: endDate)
        let weeksAndDaysLeft = countWeeksAndDays(from: startDate, to: endDate)
        let timeLeft = countTimeDifference(from: startDate, to: endDate)
        print("\n---- Time Difference ----\n\(timeLeft ?? "")")
        
        //setup label strings
        if self.localeEng {
            firstDateLabel.text = "First date: \(dateOneStr)"
            seconDateLabel.text = "Second date: \(dateTwoStr)"
            daysUntilLabel.text = "Days until: \(daysLeft)"
            weeksAndDaysUntilLabel.text = "Weeks and days until: \(weeksAndDaysLeft)"
        } else {
            firstDateLabel.text = "\(getLabel(key: "LabelFirstDateFrance")) \(dateOneStr)"
            seconDateLabel.text = "\(getLabel(key: "LabelSecondDateFrance")) \(dateTwoStr)"
            daysUntilLabel.text = "\(getLabel(key: "LabelDaysUntilFrance")) \(daysLeft)"
            weeksAndDaysUntilLabel.text = "\(getLabel(key: "LabelWeeksAndDaysUntilFrance")) \(weeksAndDaysLeft)"
        }
    }
    
    private func countDays(from olderDate: Date, to newerDate: Date) ->Int {
        let calendar = Calendar.current
        let calenderComponent = calendar.dateComponents([.day],
                                                        from: olderDate,
                                                        to: newerDate)
        return calenderComponent.value(for: .day)!
    }
    
    private func countWeeksAndDays(from olderDate: Date, to newerDate: Date) ->String {
        let days = countDays(from: olderDate, to: newerDate)
        if days>0 {
            let weeks = days/7
            let remainingDays = days%7
            return " \(weeks) weeks and \(remainingDays) days"
        }
        return "0"
    }
    
    func countTimeDifference(from olderDate: Date, to newerDate: Date) -> (String?)  {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full

        let component = Calendar.current.dateComponents([.minute , .hour , .day,.month, .weekOfMonth,.year], from: olderDate, to: newerDate)

        let yearsLeft = component.year ?? 0
        let monthsLeft = component.month ?? 0
        let weeksLeft = component.weekOfMonth ?? 0
        let daysLeft = component.day ?? 0
        let hoursLeft = component.hour ?? 0
        let minutesLeft = component.minute ?? 0
        
        
        let str = " years: \(yearsLeft)\n months: \(monthsLeft)\n weeks: \(weeksLeft)\n days: \(daysLeft)\n hours: \(hoursLeft)\n minutes: \(minutesLeft)"
        return str
    }

    @objc func datePickerValueUpdated() {
        setDate()
    }
}


//MARK:- Language Settings
extension MainViewController {
    func registerSettingsBundle() {
        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
    }
    
    func updateLanguage(){
        let defaults = UserDefaults.standard
        let frenchEnabled = defaults.bool(forKey: "useFrench")
        if frenchEnabled {
            self.localeEng = false
        } else{
            self.localeEng = true
        }
    }
    
    override func awakeFromNib() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(MainViewController.appMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        updateLanguage()
    }
    
    @objc func appMovedToForeground() { updateLanguage() }
    
    
    //Get labels from string plist
    func getLabel(key:String)->String
    {
        var value:String = ""
        if let path = Bundle.main.path(forResource: "Strings", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) as? [String: Any] {
                value = (dict[key] as! String?)! }
        }
        return value
    }
}
