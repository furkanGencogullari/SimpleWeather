//
//  ButtomSheetController.swift
//  Simple Weather
//
//  Created by Furkan Gençoğulları on 5.01.2023.
//

import UIKit
import CoreLocation

class ButtomSheetController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let sunriseImageView = UIImageView()
    let sunriseLabel = UILabel()
    
    let sunsetImageView = UIImageView()
    let sunsetLabel = UILabel()
    
    let pressureImageView = UIImageView()
    let pressureLabel = UILabel()
    
    let humidityImageView = UIImageView()
    let humidityLabel = UILabel()
    
    let windSpeedImageView = UIImageView()
    let windSpeedLabel = UILabel()
    
    let windDirectionImageView = UIImageView()
    let windDirectionLabel = UILabel()
    
    var lat = CLLocationDegrees()
    var lon = CLLocationDegrees()
    var city = String()
    
    static var weather = WeatherModel(cityName: "", temperature: 0.0, conditionId: 0,
                                      sunrise: 0.0, sunset: 0.0,
                                      airPressure: 0, humidity: 0,
                                      windSpeed: 0.0, windDirection: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        updateWeather()
        setupUI()
    }
    
    func updateWeather() {
        sunriseLabel.text = ButtomSheetController.weather.sunriseString
        sunsetLabel.text = ButtomSheetController.weather.sunsetString
        pressureLabel.text = ButtomSheetController.weather.airPressureString
        humidityLabel.text = ButtomSheetController.weather.humidityString
        windSpeedLabel.text = ButtomSheetController.weather.windSpeedString
        windDirectionLabel.text = ButtomSheetController.weather.windDirectionString
        shakeWindDirectionArrow(windDirection: ButtomSheetController.weather.windDirection)
    }
    
//MARK: Animation
    
    func shakeWindDirectionArrow(windDirection: Int) {
        let animation2 = CABasicAnimation()
        animation2.keyPath = "transform.rotation.z"
        animation2.fromValue = (CGFloat(windDirection) / 180 * CGFloat.pi) - 0.1
        animation2.toValue = (CGFloat(windDirection) / 180 * CGFloat.pi) + 0.1
        animation2.duration = 0.3
        animation2.repeatCount = .infinity
        animation2.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation2.isRemovedOnCompletion = false
        animation2.autoreverses = true
        self.windDirectionImageView.layer.add(animation2, forKey: "basic")
    }
}




