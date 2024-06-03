//
//  headerCollectionViewCell.swift
//  Armoire
//
//  Created by Kanika Gupta on 20/05/24.
//

import UIKit

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
    
    
    @IBOutlet var weatherStack: UIStackView!
    @IBOutlet var dropDownButton: UIButton!
    @IBOutlet var weatherImage: UIImageView!
    
    @IBOutlet var partyButton: UIButton!
    
    @IBOutlet var calenderLabel: UILabel!
    
    @IBOutlet var weatherDescription: UILabel!
    
    @IBOutlet var waetherLabel: UILabel!
    @IBOutlet var outfitLabel: UILabel!
    
    @IBOutlet var eventButton: [UIButton]!
    
//    @IBOutlet var myStackView: UIStackView!
    
    weak var delegate: HeaderCollectionViewCellDelegate? 
    var button = false
    
   
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        updateCalendarLabel()
//        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?zip=94040,us&units=imperial&appid=0998bf296ab8bf39403c259f84b91beb") else {return}
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let data = data, error == nil{
//                do{
//                    guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else{return}
//                    guard let weatherDetails = json["weather"] as? [[String: Any]], let weatherMain = json["main"] as? [String: Any] else {return}
//                    let temp = Int(weatherMain["temp"] as? Double ?? 0)
//                    let description = (weatherDetails.first?["description"] as? String)?.capitalizingFirstLetter()
//                    DispatchQueue.main.async {
//                        self.setWeather(weather: weatherDetails.first?["main"] as? String, description: description ?? "...",temp: temp)
//                    }
//                    
//                }
//                catch{
//                    print("We have an error in retrieving the weather")
//                }
//            }
//            
//        }
//        task.resume()
//    }
//    
//    
//    func setWeather(weather: String?, description: String, temp: Int){
//        weatherDescription.text = description
//        waetherLabel.text = "\(temp)°"
//        
//        switch weather{
//        case "Sunny":
//            weatherImage.image = UIImage(named: "sunny")
//        default:
//            weatherImage.image = UIImage(named: "cloudy")
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateCalendarLabel()
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?zip=94040,us&units=imperial&appid=0998bf296ab8bf39403c259f84b91beb") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, error == nil {
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
                    
                    // Print the entire JSON response
                    print("JSON Response: \(json)")
                    
                    guard let weatherDetails = json["weather"] as? [[String: Any]],
                          let weatherMain = json["main"] as? [String: Any] else { return }
                    
                    let temp = weatherMain["temp"] as? Double ?? 0.0
                    let description = (weatherDetails.first?["description"] as? String)?.capitalizingFirstLetter() ?? "..."
                    let weather = weatherDetails.first?["main"] as? String ?? "Unknown"
                    
                    // Print the temperature value
                    print("Temperature: \(temp)")

                    DispatchQueue.main.async {
                        self.setWeather(weather: weather, description: description, temp: Int(temp))
                    }
                    
                } catch {
                    print("We have an error in retrieving the weather")
                }
            }
        }
        task.resume()
    }

    func setWeather(weather: String, description: String, temp: Int) {
        weatherDescription.text = description
        waetherLabel.text = "\(temp)°"
        
        switch weather {
        case "Sunny":
            weatherImage.image = UIImage(named: "sunny")
        default:
            weatherImage.image = UIImage(named: "cloudy")
        }
    }

    

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
            dropDownButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        }else{
            dropDownButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
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
    private func updateCalendarLabel() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            let currentDate = Date()
            calenderLabel.text = dateFormatter.string(from: currentDate)
        }
    
    
}
//extension String{
//    func capitalizingFirstLetter() -> String{
//        return prefix(1).uppercased() + self.lowercased().dropFirst()
//    }
//}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
