//
//  headerCollectionViewCell.swift
//  Armoire
//
//  Created by Kanika Gupta on 20/05/24.
//

import UIKit
import CoreLocation

// MARK: -  Defining Protocols for drop down button opening and closing and then changing image according to event selected

protocol HeaderCollectionViewCellDelegate: AnyObject {
    func toggleLayout(isExpanded: Bool)
    func eventSelected(eventType: EventType)
}


enum EventType: String {
    case presentation = "Presentation"
    case meeting = "Meeting"
    case workout = "Workout"
    case party = "Party"
}



class headerCollectionViewCell: UICollectionViewCell {
    
//    MARK: - Outlets
    
    @IBOutlet var weatherStack: UIStackView!
    
    @IBOutlet var dropDownButton: UIButton!
    @IBOutlet var weatherImage: UIImageView!
    
    @IBOutlet var partyButton: UIButton!
    
    @IBOutlet var calenderLabel: UILabel!
    
    @IBOutlet var waetherLabel: UILabel!
    @IBOutlet var outfitLabel: UILabel!
    
    @IBOutlet var eventButton: [UIButton]!
    
    
// MARK: - Calling protocol
    
    weak var delegate: HeaderCollectionViewCellDelegate? 
    var button = false
    
    
    
    override func awakeFromNib() {
            super.awakeFromNib()
            updateCalendarLabel()
            fetchCurrentLocationWeather()
        }
    
    //    MARK: - Drop Down Button

        func showButtonVisibility(){
            eventButton.forEach{button in
                UIView.animate(withDuration: 0.5, animations: {
                    button.isHidden = !button.isHidden
                    self.contentView.layoutIfNeeded()
                })
                
            }
            
        }
            override func layoutSubviews() {
                super.layoutSubviews()
                
        }
        
        @IBAction func event(_ sender: UIButton) {
            button.toggle()
            showButtonVisibility()
            if button{
                dropDownButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
            }else{
                dropDownButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            }
            delegate?.toggleLayout(isExpanded: button)
        }
        
        
        @IBAction func eventAction(_ sender: UIButton) {
            guard let title = sender.configuration?.title,
                      let eventType = EventType(rawValue: title) else { return }
                
                delegate?.eventSelected(eventType: eventType)
            switch sender.configuration!.title!{
            case "Presentation":
                partyButton.setTitle("Presentation", for: .normal)
                
            case "Meeting":
                partyButton.setTitle("Meeting", for: .normal)
                
            case "Workout":
                partyButton.setTitle("Workout", for: .normal)
                
            default:
                partyButton.setTitle("Presentation", for: .normal)
                
            }
        }
    
   
//    MARK: - Fetching Location and Weather
    func fetchCurrentLocationWeather() {
            LocationManager.shared.didUpdateLocation = { [weak self] location in
                self?.fetchWeather(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            }
            LocationManager.shared.startUpdatingLocation()
        }
        
        func fetchWeather(latitude: Double, longitude: Double) {
            guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&units=imperial&appid=0998bf296ab8bf39403c259f84b91beb") else { return }
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, error == nil {
                    do {
                        guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                            print("Error: Could not parse JSON")
                            return
                        }
                        
                        // Print the entire JSON response
                        print("JSON Response: \(json)")
                        
                        guard let weatherDetails = json["weather"] as? [[String: Any]],
                              let weatherMain = json["main"] as? [String: Any] else {
                            print("Error: Missing 'weather' or 'main' in JSON")
                            return
                        }
                        
                        let temp = weatherMain["temp"] as? Double ?? 0.0
                        let roundedTemp = Int(round(temp))
                        let description = (weatherDetails.first?["description"] as? String)?.capitalizingFirstLetter() ?? "..."
                        let weather = weatherDetails.first?["main"] as? String ?? "Unknown"
                        
                        // Print the temperature and weather details
                        print("Temperature: \(temp)")
                        print("Weather: \(weather)")
                        print("Description: \(description)")
                        
                        DispatchQueue.main.async {
                            self.setWeather(weather: weather, description: description, temp: roundedTemp)
                        }
                        
                    } catch {
                        print("We have an error in retrieving the weather: \(error.localizedDescription)")
                    }
                } 
                else {
                    print("Network error: \(error?.localizedDescription ?? "unknown error")")
                }
            }
            task.resume()
        }
        
        func setWeather(weather: String, description: String, temp: Int) {
            
            waetherLabel.text = "\(((temp - 32) * 5)/9)°C"
            
            switch weather {
            case "Sunny":
                weatherImage.image = UIImage(named: "sunny")
            default:
                weatherImage.image = UIImage(named: "cloudy")
            }
        }
    
        

    
//    MARK: Date
    private func updateCalendarLabel() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, d MMM"
        let currentDate = Date()
        calenderLabel.text = dateFormatter.string(from: currentDate)
    }

}

// MARK: - Extension

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
