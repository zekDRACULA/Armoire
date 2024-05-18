//
//  CalendarViewController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 16/05/24.
//

import UIKit

class CalendarViewController: UIViewController,UICalendarViewDelegate,UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        print(selection)
    }
    
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        return nil
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tabBarItem.title = "Calendar"
        self.tabBarItem.image = UIImage(systemName: "calendar")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCalendar()
        
        tabBarItem.title = "Calendar"
        tabBarItem.image = UIImage(systemName: "calendar")
        // Do any additional setup after loading the view.
    }
    
    func createCalendar(){
        let calendarView = UICalendarView()
        
        calendarView.calendar  = .current
        calendarView.locale = .current
        calendarView.fontDesign = .rounded
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
        
        calendarView.delegate = self
        calendarView.translatesAutoresizingMaskIntoConstraints = false
//        calendarView.frame = CGRect(x: 0, y: 0, width: 400, height: 600)
        view.addSubview(calendarView)
        //adding constraints to this calendar
        
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            calendarView.heightAnchor.constraint(equalToConstant: 600),
            calendarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)
        ])
        
        
    }
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
