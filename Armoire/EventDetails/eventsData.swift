//
//  eventsData.swift
//  Armoire
//
//  Created by Abhay singh on 28/05/24.
//

import Foundation

struct EventData{
    
    var eventDate : String
    var eventTitle : String
    var eventLocation : String
    var eventDuration : String
    var eventType  : String
    
}

class EventDataModel{
    static var eventData : [EventData] = [EventData(eventDate: "Sunday, 2 Jun 2024", eventTitle: "trip", eventLocation: "Srinagar",                                     eventDuration: "all-day", eventType: "Home"),
                                         EventData(eventDate: "Thursday, 13 Jun 2024", eventTitle: "trip", eventLocation: "Meeting",  eventDuration: "3:30 PM", eventType: "Work"),
                                          EventData(eventDate: "Monday, 18 Jun 2024", eventTitle: "trip", eventLocation: "Shopping",  eventDuration: "7:00 PM", eventType: "Home"),
                                          EventData(eventDate: "Sunday, 24 Jun 2024", eventTitle: "trip", eventLocation: "Party", eventDuration: "8:00 PM", eventType: "Home"),
                                          EventData(eventDate: "Monday, 2 Jul 2024", eventTitle: "trip", eventLocation: "Bussiness Trip",  eventDuration: "all-day", eventType: "Home"),
                                        EventData(eventDate: "Sunday, 3 Jul 2024", eventTitle: "trip", eventLocation: "Bussiness Trip",  eventDuration: "end 5:00 PM", eventType: "Work"),
    ]
}
