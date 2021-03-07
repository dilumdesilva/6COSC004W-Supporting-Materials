//
//  DatePickerVC.swift
//  DatePicker
//
//  Created by Venoli Gamage on 2021-03-07.
//


import UIKit

class DatePickerVC: UIViewController {
    
    let dateFormatter = DateFormatter()
    @IBOutlet weak var datePickerFirst: UIDatePicker!
    @IBOutlet weak var datePickerSecond: UIDatePicker!
    
    @IBOutlet weak var firstDateLabel: UILabel!
    @IBOutlet weak var secondDateLabel: UILabel!
    @IBOutlet weak var daysUntilLabel: UILabel!
    @IBOutlet weak var weeksAndDaysUntilLabel: UILabel!
    var localeEng = true
    
    override func viewDidLoad() {
        print("View")
        setupUI()
        updateDates()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(DatePickerVC.appMovedToForeground), name:
                                        UIApplication.willEnterForegroundNotification, object: nil)

    }
    
    private func setupUI(){
        datePickerFirst?.preferredDatePickerStyle = .wheels
        //setDate()
       
        
    }
    
    private func setDate(){
        datePickerFirst.datePickerMode = .date
        let dateOne = datePickerFirst.date
        dateFormatter.setLocalizedDateFormatFromTemplate("dd MMM yyy")
        let dateOneStr = dateFormatter.string(from: dateOne as Date)
        firstDateLabel.text = "First Date: \(dateOneStr)"
        
        let dateTwo = datePickerSecond.date
        let dateTwoStr = dateFormatter.string(from: dateTwo as Date)
        secondDateLabel.text = "Second Date: \(dateTwoStr)"
       
        let dateBetween = daysBetween(date1:dateOne,date2:dateTwo)
        daysUntilLabel.text = "Days Until: \(String(dateBetween))"
    
        let weeksAndDateUntil = weekAndDaysBetween(date1: dateOne, date2: dateTwo)
        weeksAndDaysUntilLabel.text = weeksAndDateUntil
    }
    
    func daysBetween(date1:Date, date2:Date) ->Int {
        //Int(date2.timeIntervalSince(date1))
        let calender = Calendar.current
        let calenderComponent = calender.dateComponents([.day], from: date1, to: date2)
        return calenderComponent.value(for: .day)!
    }
    func weekAndDaysBetween(date1:Date, date2:Date) ->String{
        let days = daysBetween(date1:date1,date2:date2)
        let weeks = days/7
        let modDays = days%7
        return " \(weeks) weeks and \(modDays) days"
    }
    @IBAction func datePickerOneValueChanged(_ sender: Any) {
        //setDate()
        updateDates()
    }
    
    @IBAction func datePickerTwoValueChanged(_ sender: Any) {
        //setDate()
        updateDates()
    }
    func registerSettingsBundle(){
    let appDefaults = [String:AnyObject]()
    UserDefaults.standard.register(defaults: appDefaults)
    }
    func updateLanguage(){
    //Get the defaults
    let defaults = UserDefaults.standard
    let useFrench = defaults.bool(forKey: "useFrench")
    if useFrench{
    self.localeEng = false
    }
    else{
    self.localeEng = true
    }
        updateDates()


    }
    
    override func awakeFromNib() {
        print("Awake")
        
    }
    
    @objc func appMovedToForeground()
    {
    updateLanguage()

    }
    
    func getLabel(key:String)->String
    {
    var value:String = ""
    if let path = Bundle.main.path(forResource: "LabelStrings", ofType: "plist") {
    ////If your plist contain root as Dictionary
    if let dict = NSDictionary(contentsOfFile: path) as? [String: Any] {
    value = (dict[key] as! String?)!
    }
    }
    return value
    }
    
    func updateDates()
    {
    //set up first and second date labels
    var dateOne:String = ""
    var dateTwo:String = ""
    var dateBetween:String = ""
    var weeksAndDateUntil:String = ""
    if self.localeEng {
    dateOne = getLabel(key: "LabelFirstDate")
    dateTwo = getLabel(key: "LabelSecondDate")
    dateBetween = getLabel(key: "LabelSecondDate")
    weeksAndDateUntil = getLabel(key: "LabelSecondDate")

    }
    else {
        dateOne = getLabel(key: "LabelFirstDateFr")
        dateTwo = getLabel(key: "LabelSecondDateFr")
        dateBetween = getLabel(key: "LabelSecondDateFr")
        weeksAndDateUntil = getLabel(key: "LabelSecondDateFr")
    }
        let dateFormatter = DateFormatter()
        if self.localeEng
        {
        dateFormatter.locale = Locale.current
        dateFormatter.locale = Locale(identifier: "en_GB")
        }
        else {
        dateFormatter.locale = Locale.current
        dateFormatter.locale = Locale(identifier: "fr_FR")
        }
        //set to full date style
        dateFormatter.dateStyle = DateFormatter.Style.full
        var styledDate = dateFormatter.string(from:datePickerFirst.date)
        dateOne.append(" \(styledDate)")
        styledDate = dateFormatter.string(from: datePickerSecond.date)
        dateTwo.append(" \(styledDate)")
        
        firstDateLabel.text = dateOne
        secondDateLabel.text = dateTwo
        
        let numOfDates = daysBetween(date1:datePickerFirst.date,date2:datePickerSecond.date)
        dateBetween.append("\(numOfDates)")
        daysUntilLabel.text = "\(String(dateBetween))"
    
        weeksAndDateUntil.append("\(weekAndDaysBetween(date1: datePickerFirst.date, date2: datePickerSecond.date))")
        weeksAndDaysUntilLabel.text = weeksAndDateUntil
      
    
        }
}
