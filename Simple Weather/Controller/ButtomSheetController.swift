//
//  ButtomSheetController.swift
//  Simple Weather
//
//  Created by Furkan Gençoğulları on 5.01.2023.
//

import UIKit

class ButtomSheetController: UIViewController {
    
    var weatherEngine = WeatherEngine()
    
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
    
    let windDegreesImageView = UIImageView()
    let windDegreesLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherEngine.delegate = self
        
        weatherEngine.getWeather(cityName: "istanbul")
        
        view.backgroundColor = .clear
        
        scrollView.contentSize = CGSize(width: view.frame.width * 2, height: 250)
        createUI()
    }
    
    
    func createUI() {
        let width = view.frame.width
        
        
        
        let firstView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 250))
        let secondView = UIView(frame: CGRect(x: view.frame.width, y: 0, width: view.frame.width, height: 250))
        
        firstView.backgroundColor = .clear
        secondView.backgroundColor = .clear
        
        
        scrollView.addSubview(firstView)
        scrollView.addSubview(secondView)
        
        
        sunriseImageView.frame = CGRect(x: width * 0.20,
                                        y: 40,
                                        width: width * 0.09,
                                        height: width * 0.09)
        
        sunriseImageView.image = UIImage(systemName: Symbols.sunrise)
        sunriseImageView.contentMode = .scaleAspectFit
        firstView.addSubview(sunriseImageView)
        
        
        sunriseLabel.frame = CGRect(x: (width * 0.20) + (width * 0.09) + (width * 0.02),
                                                 y: 40,
                                                 width: width * 0.15,
                                                 height: width * 0.09)
        sunriseLabel.text = "07:23"
        sunriseLabel.font = UIFont(name: "PingFang HK Medium", size: 17)
        sunriseLabel.textColor = UIColor(named: "AccentColor")
        firstView.addSubview(sunriseLabel)
        
        
        sunsetImageView.frame = CGRect(x: width - (width * 0.20) - (width * 0.15) - (width * 0.02) - (width * 0.09),
                                                        y: 40,
                                                        width: width * 0.09,
                                                        height: width * 0.09)
        sunsetImageView.image = UIImage(systemName: Symbols.sunset)
        sunsetImageView.contentMode = .scaleAspectFit
        firstView.addSubview(sunsetImageView)
        
        
        sunsetLabel.frame = CGRect(x: width - (width * 0.20) - (width * 0.15),
                                                y: 40,
                                                width: width * 0.15,
                                                height: width * 0.09)
        sunsetLabel.text = "18:23"
        sunsetLabel.font = UIFont(name: "PingFang HK Medium", size: 17)
        sunsetLabel.textColor = UIColor(named: "AccentColor")
        firstView.addSubview(sunsetLabel)
        
        
        pressureImageView.frame = CGRect(x: width * 0.20,
                                                          y: 40 + (width * 0.09) + 20,
                                                          width: width * 0.09,
                                                          height: width * 0.09)
        pressureImageView.image = UIImage(systemName: "barometer")
        pressureImageView.contentMode = .scaleAspectFit
        firstView.addSubview(pressureImageView)
        
        
        pressureLabel.frame = CGRect(x: (width * 0.20) + (width * 0.09) + (width * 0.02),
                                                  y: 40 + (width * 0.09) + 20,
                                                  width: width * 0.15,
                                                  height: width * 0.09)
        pressureLabel.text = "1014 hPa"
        pressureLabel.font = UIFont(name: "PingFang HK Medium", size: 17)
        pressureLabel.adjustsFontSizeToFitWidth = true
        pressureLabel.textColor = UIColor(named: "AccentColor")
        firstView.addSubview(pressureLabel)
        
        
        humidityImageView.frame = CGRect(x: width - (width * 0.20) - (width * 0.15) - (width * 0.02) - (width * 0.09),
                                                      y: 40 + (width * 0.09) + 20,
                                                      width: width * 0.09,
                                                      height: width * 0.09)
        humidityImageView.image = UIImage(systemName: "humidity")
        humidityImageView.contentMode = .scaleAspectFit
        firstView.addSubview(humidityImageView)
        
        
        humidityLabel.frame = CGRect(x: width - (width * 0.20) - (width * 0.15),
                                                  y: 40 + (width * 0.09) + 20,
                                                  width: width * 0.15,
                                                  height: width * 0.09)
        humidityLabel.text = "%76"
        humidityLabel.font = UIFont(name: "PingFang HK Medium", size: 17)
        humidityLabel.textColor = UIColor(named: "AccentColor")
        firstView.addSubview(humidityLabel)
        
        
        windSpeedImageView.frame = CGRect(x: width * 0.20,
                                                           y: 40 + (((width * 0.09) + 20) * 2),
                                                           width: width * 0.09,
                                                           height: width * 0.09)
        windSpeedImageView.image = UIImage(systemName: "wind")
        windSpeedImageView.contentMode = .scaleAspectFit
        firstView.addSubview(windSpeedImageView)
        
        
        windSpeedLabel.frame = CGRect(x: (width * 0.20) + (width * 0.09) + (width * 0.02),
                                                   y: 40 + (((width * 0.09) + 20) * 2),
                                                   width: width * 0.15,
                                                   height: width * 0.09)
        windSpeedLabel.text = "1.54 m/s"
        windSpeedLabel.font = UIFont(name: "PingFang HK Medium", size: 17)
        windSpeedLabel.textColor = UIColor(named: "AccentColor")
        windSpeedLabel.adjustsFontSizeToFitWidth = true
        firstView.addSubview(windSpeedLabel)
        
        
        windDegreesImageView.frame = CGRect(x: width - (width * 0.20) - (width * 0.15) - (width * 0.02) - (width * 0.09),
                                                         y: 40 + (((width * 0.09) + 20) * 2),
                                                         width: width * 0.09,
                                                         height: width * 0.09)
        windDegreesImageView.image = UIImage(systemName: "arrow.up")
        windDegreesImageView.contentMode = .scaleAspectFit
        firstView.addSubview(windDegreesImageView)
        
        
        
        windDegreesLabel.frame = CGRect(x: width - (width * 0.20) - (width * 0.15),
                                                   y: 40 + (((width * 0.09) + 20) * 2),
                                                   width: width * 0.15,
                                                   height: width * 0.09)
        windDegreesLabel.text = "150°"
        windDegreesLabel.font = UIFont(name: "PingFang HK Medium", size: 17)
        windDegreesLabel.textColor = UIColor(named: "AccentColor")
        firstView.addSubview(windDegreesLabel)
    }
    
}

extension ButtomSheetController: WeatherEngineDelegate {
    func didUpdateWeather(weather: WeatherModel) {
        DispatchQueue.main.async {
            self.sunriseLabel.text = weather.sunriseString
            self.sunsetLabel.text = weather.sunsetString
            self.pressureLabel.text = weather.airPressureString
            self.humidityLabel.text = weather.humidityString
            self.windSpeedLabel.text = weather.windSpeedString
            self.windDegreesLabel.text = weather.windDirectionString
        }
    }
    
    func didFinishWithError(error: Error) {
        print(error.localizedDescription)
    }
    
    
}
