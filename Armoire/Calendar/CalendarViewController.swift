
//  Armoire
//
//  Created by Aditya on 16/05/24.
//


import UIKit
import EventKitUI
import EventKit

class CalendarViewController: UIViewController, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate, EKEventEditViewDelegate {

    let store = EKEventStore()
//    var eventInfoArray:[CalendarEventInfo] = []
//    var eventInfoEverything = AllAddedEventDetails()
    
    
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            guard let dateComponents = dateComponents, let selectedDate = Calendar.current.date(from: dateComponents) else {
                return
            }

            let endDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate)!

            let predicate = store.predicateForEvents(withStart: selectedDate, end: endDate, calendars: nil)

            let events = store.events(matching: predicate)

            if events.isEmpty {
                let alert = UIAlertController(title: "No Events", message: "There are no events for the selected date.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            } else {
                let eventsVC = EventsTableViewController(events: events)
                navigationController?.pushViewController(eventsVC, animated: true)
            }
        }
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        let date = Calendar.current.date(from: dateComponents)!
        let endDate = Calendar.current.date(byAdding: .day, value: 1, to: date)!

        let predicate = store.predicateForEvents(withStart: date, end: endDate, calendars: nil)
        let events = store.events(matching: predicate)

        if !events.isEmpty {
            return .default(color: .accent,size: .large)
        }

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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    func createCalendar() {
        let calendarView = UICalendarView()
        
        calendarView.calendar = .current
        calendarView.locale = .current
        calendarView.fontDesign = .rounded
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
        
        calendarView.delegate = self
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendarView)
        
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calendarView.heightAnchor.constraint(equalToConstant: 600),
            calendarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)
        ])
    }

    @objc func didTapAdd() {
        switch EKEventStore.authorizationStatus(for: .event) {
        case .notDetermined:
            store.requestFullAccessToEvents { [weak self] granted, error in
                DispatchQueue.main.async {
                    if granted {
                        self?.presentEventEditViewController()
                    } else if let error = error {
                        print("Failed to request access: \(error.localizedDescription)")
                    }
                }
            }
        case .authorized:
            presentEventEditViewController()
        default:
            break
        }
    }
    
    func presentEventEditViewController() {
        let eventVC = EKEventEditViewController()
        eventVC.editViewDelegate = self
        
        eventVC.eventStore = store
        
        let event = EKEvent(eventStore: store)
        event.title = ""
        event.startDate = Date()
        event.endDate = Date()
        event.location = ""
        
        eventVC.event = event
        
        
        
        self.present(eventVC, animated: true, completion: nil)
    }
    
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        if action != .canceled {
            if let event = controller.event {

                let title = event.title
                let startDate = event.startDate
                let endDate = event.endDate
                let location = event.location
                
                let newEventDetails = CalendarEventInfo(eventTitle: title ?? "No Title", eventStartDate: startDate!, eventEndDate: endDate!, eventLocation: location ?? "No Location")
                AllAddedEventDetails.allEventsinformation.append(newEventDetails)
//                eventInfoEverything.allEventsinformation.append(newEventDetails)
                print(AllAddedEventDetails.allEventsinformation)
                
//                eventInfoArray.append(newEventDetails)
                
                
//                print(eventInfoArray)
                
                
//                print("Event Title:\(title ?? "No title")")
//                print("Start Date:\(startDate)")
//                print("End Date:\(endDate)")
//                print("Loaction: \(location ?? "No Location")")

                
                if startDate == endDate {
                    
                    let storyboard = UIStoryboard(name: "EventSugeestions", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "suggestionsVC")
                    
                    
                    controller.present(vc, animated: true)
    
                
                } else {

                    controller.dismiss(animated: true, completion: nil)
                }
            }
        } else {

            controller.dismiss(animated: true, completion: nil)
        }
    }
}


class EventsTableViewController: UITableViewController {
    var events: [EKEvent]

    init(events: [EKEvent]) {
        self.events = events
        super.init(style: .insetGrouped)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(named: "bgColorProfile")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(named: "cellColor")
        cell.selectionStyle = .none
        let event = events[indexPath.row]
        cell.textLabel?.text = event.title
        return cell
    }

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let event = events[indexPath.row]
//        let eventVC = EKEventViewController()
//        eventVC.event = event
//        eventVC.allowsEditing = false
//        navigationController?.pushViewController(eventVC, animated: true)
//    }
}
