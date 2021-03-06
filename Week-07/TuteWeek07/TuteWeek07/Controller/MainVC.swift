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
        let dateOne = datePickerOne.date
        dateFormatter.setLocalizedDateFormatFromTemplate("dd MMM yyyy")
        let dateOneStr = dateFormatter.string(from: dateOne as Date)
        print("DateOne: \(dateOneStr)")
        
        firstDateLabel.text = "First date: \(dateOneStr)"
        
        let dateTwo = datePickerTwo.date
        dateFormatter.setLocalizedDateFormatFromTemplate("dd MMM yyyy")
        let dateTwoStr = dateFormatter.string(from: dateTwo as Date)
        print("DateTwo: \(dateTwoStr)")
        
        seconDateLabel.text = "Second date: \(dateTwoStr)"
        
        let daysUntil = countDaysUntil(date1: dateOne, date2: dateTwo)
        daysUntilLabel.text = "Days until: \(daysUntil)"
        
        let weeksAndDaysUntil = weekAndDaysBetween(date1: dateOne, date2: dateTwo)
        weeksAndDaysUntilLabel.text = "Weeks and days until: \(weeksAndDaysUntil)"
    }
    
    private func countDaysUntil(date1:Date, date2:Date) ->Int {
        let calendar = Calendar.current
        let calenderComponent = calendar.dateComponents([.day], from: date1, to: date2)
        return calenderComponent.value(for: .day)!
    }
    
    private func weekAndDaysBetween(date1:Date, date2:Date) ->String{
        return ""
    }

    @objc func datePickerValueUpdated() {
        setDate()
    }
    
    
}
