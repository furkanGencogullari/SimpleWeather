//
//  ButtomSheetControllerUI.swift
//  Simple Weather
//
//  Created by Furkan Gençoğulları on 24.01.2023.
//

import UIKit

extension ButtomSheetController {
 
    func setupUI() {
        let width = view.frame.width
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: 250)
        
        
        
        let firstView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 250))
        
        firstView.backgroundColor = .clear
        
        scrollView.addSubview(firstView)
        
        sunriseImageView.frame = CGRect(x: width * 0.20,
                                        y: 40,
                                        width: width * 0.09,
                                        height: width * 0.09)
        
        sunriseImageView.image = UIImage(systemName: "sunrise")
        sunriseImageView.contentMode = .scaleAspectFit
        firstView.addSubview(sunriseImageView)
        
        
        sunriseLabel.frame = CGRect(x: (width * 0.20) + (width * 0.09) + (width * 0.02),
                                                    y: 40,
                                                    width: width * 0.15,
                                                    height: width * 0.09)
        sunriseLabel.font = UIFont(name: K.brandFont, size: 17)
        sunriseLabel.textColor = UIColor(named: K.accentColor)
        firstView.addSubview(sunriseLabel)
        
        
        sunsetImageView.frame = CGRect(x: width - (width * 0.20) - (width * 0.15) - (width * 0.02) - (width * 0.09),
                                                        y: 40,
                                                        width: width * 0.09,
                                                        height: width * 0.09)
        sunsetImageView.image = UIImage(systemName: "sunset")
        sunsetImageView.contentMode = .scaleAspectFit
        firstView.addSubview(sunsetImageView)
        
        
        sunsetLabel.frame = CGRect(x: width - (width * 0.20) - (width * 0.15),
                                                y: 40,
                                                width: width * 0.15,
                                                height: width * 0.09)
        sunsetLabel.font = UIFont(name: K.brandFont, size: 17)
        sunsetLabel.textColor = UIColor(named: K.accentColor)
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
        pressureLabel.font = UIFont(name: K.brandFont, size: 17)
        pressureLabel.adjustsFontSizeToFitWidth = true
        pressureLabel.textColor = UIColor(named: K.accentColor)
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
        humidityLabel.font = UIFont(name: K.brandFont, size: 17)
        humidityLabel.textColor = UIColor(named: K.accentColor)
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
        windSpeedLabel.font = UIFont(name: K.brandFont, size: 17)
        windSpeedLabel.textColor = UIColor(named: K.accentColor)
        windSpeedLabel.adjustsFontSizeToFitWidth = true
        firstView.addSubview(windSpeedLabel)
        
        
        windDirectionImageView.frame = CGRect(x: width - (width * 0.20) - (width * 0.15) - (width * 0.02) - (width * 0.09),
                                                            y: 40 + (((width * 0.09) + 20) * 2),
                                                            width: width * 0.09,
                                                            height: width * 0.09)
        windDirectionImageView.image = UIImage(systemName: "arrow.up")
        windDirectionImageView.contentMode = .scaleAspectFit
        firstView.addSubview(windDirectionImageView)
        
        
        
        windDirectionLabel.frame = CGRect(x: width - (width * 0.20) - (width * 0.15),
                                                    y: 40 + (((width * 0.09) + 20) * 2),
                                                    width: width * 0.15,
                                                    height: width * 0.09)
        windDirectionLabel.font = UIFont(name: K.brandFont, size: 17)
        windDirectionLabel.textColor = UIColor(named: K.accentColor)
        firstView.addSubview(windDirectionLabel)
    }
}
