//
//  CalendarViewController.swift
//  Armoire
//
//  Created by Hitesh Rupani on 16/05/24.
//

import UIKit
import EventKitUI
import EventKit


class CalendarViewController: UIViewController,UICalendarViewDelegate,UICalendarSelectionSingleDateDelegate,EKEventEditViewDelegate{
    
    
    
    let store = EKEventStore()
    
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
        
        //added navigation for add button
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        
        
      
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
    // event kit functions
    func didTapAdd(){
        
//        switch EKEventStore.authorizationStatus(for: .event) {
//        case .notDetermined:
//            EKEventStore.authorizationStatus(for: .event){granted,error in
//            }
//
//        case .authorized:
//            print("Authorired")
//        default:
//            break
//        }
        
        
        
        
        
        
//        store.requestAccess(to: .event){ [weak self] success,error in
//            if success,error == nil {
//                DispatchQueue.main.async {
//                    guard let store = self?.store else{return}
//                    let newEvent = EKEvent(eventStore: store)
//                    
//                
//                    newEvent.title = ""
//                    newEvent.startDate = Date()
//                    newEvent.endDate = Date()
//
//                    
//                    let otherVC = EKEventEditViewController()
//                    otherVC.eventStore = store
//                    otherVC.event = newEvent
//                    self?.present(otherVC, animated: true, completion: nil)
        
        let eventVC = EKEventEditViewController()
        eventVC.editViewDelegate = self
        eventVC.eventStore = EKEventStore()
        
        
        let event = EKEvent(eventStore: eventVC.eventStore)
        event.title = ""
        event.startDate = Date()
        event.endDate = Date()
        
        eventVC.event = event
        
        self.present(eventVC, animated: true, completion: nil)
        
        
        
//
//                    
//                    
////                    let vc = EKEventViewController()
////                    vc.delegate=self
////                    vc.event = newEvent
////                    let navVc = UINavigationController(rootViewController: vc)
////                    self?.present(navVc, animated: true)
//                }
//            }
//        }
        
        
        
    }
    
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true, completion: nil)
    }
//
//    func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
//        
//        controller.dismiss(animated: true, completion: nil)
//        
//    }
//    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
//        controller.dismiss(animated: true, completion: nil)
//    }
    
    
    
    
    @IBAction func addButtonTApped(_ sender: UIBarButtonItem) {
        didTapAdd()
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
