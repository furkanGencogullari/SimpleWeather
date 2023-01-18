//
//  ViewController.swift
//  Simple Weather
//
//  Created by Furkan Gençoğulları on 5.01.2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
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
        
        weatherEngine.delegate2 = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(showMyViewControllerInACustomizedSheet))
        
        locationManager.requestLocation()
        
        blurView.layer.cornerRadius = 10
        blurView.clipsToBounds = true
        blurView.isUserInteractionEnabled = true
        blurView.addGestureRecognizer(gesture)
        
        searchTextField.layer.cornerRadius = 20
        searchTextField.placeholder = "Search"
        
        
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        if let searchedCity = searchTextField.text {
            weatherEngine.getWeather(cityName: searchedCity)
        }
    }
    
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
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
    

}


//MARK: WeatherEngineDelegate
extension ViewController: WeatherEngineDelegate2 {
    func didUpdateWeather(weather: WeatherModel) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.weatherConditionLabel.text = weather.conditionName
            self.weatherConditionImageView.image = UIImage(systemName: weather.conditionImage)
        }
    }
    
    func didFinishWithError(error: Error) {
        print("didFinishWithError")
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
            print("Lat: \(lat) \n Lon: \(lon)")
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("ERROR \n locationManager")
    }
}



