//
//  ButtomSheetController.swift
//  Simple Weather
//
//  Created by Furkan Gençoğulları on 5.01.2023.
//

import UIKit

class ButtomSheetController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        scrollView.contentSize = CGSize(width: view.frame.width * 2, height: 250)
        
        createUI()
    }
    
    
    func createUI() {
        
        let height = view.frame.height
        let width = view.frame.width
        
        
        
        let firstView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 250))
        let secondView = UIView(frame: CGRect(x: view.frame.width, y: 0, width: view.frame.width, height: 250))
        
        firstView.backgroundColor = .clear
        secondView.backgroundColor = .clear
        
        scrollView.addSubview(firstView)
        scrollView.addSubview(secondView)
        
        let sunriseImageView = UIImageView(frame: CGRect(x: width * 0.20,
                                                         y: 40,
                                                         width: width * 0.09,
                                                         height: width * 0.09))
        
        sunriseImageView.image = UIImage(systemName: Symbols.sunrise)
        sunriseImageView.contentMode = .scaleAspectFit
        firstView.addSubview(sunriseImageView)
        
        
        let sunriseLabel = UILabel(frame: CGRect(x: (width * 0.20) + (width * 0.09) + (width * 0.02),
                                                 y: 40,
                                                 width: width * 0.15,
                                                 height: width * 0.09))
        sunriseLabel.text = "07:23"
        sunriseLabel.font = UIFont(name: "PingFang HK Medium", size: 17)
        sunriseLabel.textColor = UIColor(named: "AccentColor")
        firstView.addSubview(sunriseLabel)
        
        
        let sunsetImageView = UIImageView(frame: CGRect(x: width - (width * 0.20) - (width * 0.15) - (width * 0.02) - (width * 0.09),
                                                        y: 40,
                                                        width: width * 0.09,
                                                        height: width * 0.09))
        sunsetImageView.image = UIImage(systemName: Symbols.sunset)
        sunsetImageView.contentMode = .scaleAspectFit
        firstView.addSubview(sunsetImageView)
        
        
        let sunsetLabel = UILabel(frame: CGRect(x: width - (width * 0.20) - (width * 0.15),
                                                y: 40,
                                                width: width * 0.15,
                                                height: width * 0.09))
        sunsetLabel.text = "18:23"
        sunsetLabel.font = UIFont(name: "PingFang HK Medium", size: 17)
        sunsetLabel.textColor = UIColor(named: "AccentColor")
        firstView.addSubview(sunsetLabel)
        
        
        let pressureImageView = UIImageView(frame: CGRect(x: width * 0.20,
                                                          y: 40 + (width * 0.09) + 20,
                                                          width: width * 0.09,
                                                          height: width * 0.09))
        pressureImageView.image = UIImage(systemName: "barometer")
        pressureImageView.contentMode = .scaleAspectFit
        firstView.addSubview(pressureImageView)
        
        
        let pressureLabel = UILabel(frame: CGRect(x: (width * 0.20) + (width * 0.09) + (width * 0.02),
                                                  y: 40 + (width * 0.09) + 20,
                                                  width: width * 0.15,
                                                  height: width * 0.09))
        pressureLabel.text = "1014 hPa"
        pressureLabel.font = UIFont(name: "PingFang HK Medium", size: 17)
        pressureLabel.adjustsFontSizeToFitWidth = true
        pressureLabel.textColor = UIColor(named: "AccentColor")
        firstView.addSubview(pressureLabel)
        
        
        let humidityImageView = UIImageView(frame: CGRect(x: width - (width * 0.20) - (width * 0.15) - (width * 0.02) - (width * 0.09),
                                                      y: 40 + (width * 0.09) + 20,
                                                      width: width * 0.09,
                                                      height: width * 0.09))
        humidityImageView.image = UIImage(systemName: "humidity")
        humidityImageView.contentMode = .scaleAspectFit
        firstView.addSubview(humidityImageView)
        
        
        let humidityLabel = UILabel(frame: CGRect(x: width - (width * 0.20) - (width * 0.15),
                                                  y: 40 + (width * 0.09) + 20,
                                                  width: width * 0.15,
                                                  height: width * 0.09))
        humidityLabel.text = "%76"
        humidityLabel.font = UIFont(name: "PingFang HK Medium", size: 17)
        humidityLabel.textColor = UIColor(named: "AccentColor")
        firstView.addSubview(humidityLabel)
        
        
        let windSpeedImageView = UIImageView(frame: CGRect(x: width * 0.20,
                                                           y: 40 + (((width * 0.09) + 20) * 2),
                                                           width: width * 0.09,
                                                           height: width * 0.09))
        windSpeedImageView.image = UIImage(systemName: "wind")
        windSpeedImageView.contentMode = .scaleAspectFit
        firstView.addSubview(windSpeedImageView)
        
        
        let windSpeedLabel = UILabel(frame: CGRect(x: (width * 0.20) + (width * 0.09) + (width * 0.02),
                                                   y: 40 + (((width * 0.09) + 20) * 2),
                                                   width: width * 0.15,
                                                   height: width * 0.09))
        windSpeedLabel.text = "1.54 m/s"
        windSpeedLabel.font = UIFont(name: "PingFang HK Medium", size: 17)
        windSpeedLabel.textColor = UIColor(named: "AccentColor")
        windSpeedLabel.adjustsFontSizeToFitWidth = true
        firstView.addSubview(windSpeedLabel)
        
        
        let windDegreesImageView = UIImageView(frame: CGRect(x: width - (width * 0.20) - (width * 0.15) - (width * 0.02) - (width * 0.09),
                                                         y: 40 + (((width * 0.09) + 20) * 2),
                                                         width: width * 0.09,
                                                         height: width * 0.09))
        windDegreesImageView.image = UIImage(systemName: "arrow.up")
        windDegreesImageView.contentMode = .scaleAspectFit
        firstView.addSubview(windDegreesImageView)
        
        
        
        let windDegreesLabel = UILabel(frame: CGRect(x: width - (width * 0.20) - (width * 0.15),
                                                   y: 40 + (((width * 0.09) + 20) * 2),
                                                   width: width * 0.15,
                                                   height: width * 0.09))
        windDegreesLabel.text = "150°"
        windDegreesLabel.font = UIFont(name: "PingFang HK Medium", size: 17)
        windDegreesLabel.textColor = UIColor(named: "AccentColor")
        firstView.addSubview(windDegreesLabel)
    }
    
}
