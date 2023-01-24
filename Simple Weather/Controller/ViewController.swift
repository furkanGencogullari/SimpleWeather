//
//  ViewController.swift
//  Simple Weather
//
//  Created by Furkan Gençoğulları on 5.01.2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherConditionLabel: UILabel!
    @IBOutlet weak var weatherConditionImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherEngine = WeatherEngine()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        animateConditionImage()
        
        weatherEngine.delegate = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.requestLocation()
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        if searchTextField.text != "" {
            if let searchedCity = searchTextField.text {
                weatherEngine.getWeather(cityName: searchedCity)
                searchTextField.endEditing(true)
                searchTextField.text = nil
            }
        } else {
            animateSearchButton()
            self.present(AlertEngine.createErrorAlert(title: "Error", message: "Please enter a location."), animated: true)
        }
    }
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
        animateLocationButton()
    }
    
    @objc func showMyViewControllerInACustomizedSheet() {
        let viewControllerToPresent = ButtomSheetController()
        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.detents = [.custom(resolver: { context in
                return 250
            })]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            sheet.preferredCornerRadius = 50
        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    func setupUI() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(showMyViewControllerInACustomizedSheet))
        
        blurView.layer.cornerRadius = 10
        blurView.clipsToBounds = true
        blurView.isUserInteractionEnabled = true
        blurView.addGestureRecognizer(gesture)
        
        searchTextField.layer.cornerRadius = 20
        searchTextField.placeholder = "Search"
    }
    
    func createAlert(title: String, message: String) {
        self.present(AlertEngine.createErrorAlert(title: "Error", message: message), animated: true)
    }
}

//MARK: WeatherEngineDelegate
extension ViewController: WeatherEngineDelegate {
    func didUpdateWeather(weather: WeatherModel) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.weatherConditionLabel.text = weather.conditionName
            self.weatherConditionImageView.image = UIImage(systemName: weather.conditionImage)
        }
    }
    
    func didFinishWithError(error: Error) {
        self.present(AlertEngine.createErrorAlert(title: "Error", error: error), animated: true)
    }
}

//MARK: LocationManagerDelegate
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherEngine.getWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("ERROR \n locationManager")
    }
}

//MARK: Animations
extension ViewController {
    func animateConditionImage(){
        let animation = CABasicAnimation()
        animation.keyPath = "position.y"
        animation.fromValue = weatherConditionImageView.frame.midY
        animation.toValue = weatherConditionImageView.frame.midY - 10
        animation.duration = 1.5
        animation.repeatDuration = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.autoreverses = true
        
        weatherConditionImageView.layer.add(animation, forKey: "basic")
    }
    
    func animateSearchButton() {
        let animation = CABasicAnimation()
        animation.keyPath = "position.y"
        animation.fromValue = searchButton.frame.midY
        animation.toValue = searchButton.frame.midY - 2
        animation.duration = 0.1
        animation.repeatCount = 2
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.autoreverses = true
        
        searchButton.layer.add(animation, forKey: "basic")
    }
    
    func animateLocationButton() {
        let animation = CABasicAnimation()
        animation.keyPath = "position.y"
        animation.fromValue = locationButton.frame.midY
        animation.toValue = locationButton.frame.midY - 3
        animation.duration = 0.5
        animation.repeatCount = 2
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.autoreverses = true
        
        locationButton.layer.add(animation, forKey: "basic")
    }
}





