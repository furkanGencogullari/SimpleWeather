//
//  ViewController.swift
//  Simple Weather
//
//  Created by Furkan Gençoğulları on 5.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherConditionLabel: UILabel!
    @IBOutlet weak var weatherConditionImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherEngine = WeatherEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        weatherEngine.delegate2 = self
        
        blurView.layer.cornerRadius = 10
        blurView.clipsToBounds = true
        
        searchTextField.layer.cornerRadius = 20
        searchTextField.placeholder = "Search"
        
        weatherEngine.getWeather(cityName: "istanbul")
    }
    
    @IBAction func myButton(_ sender: UIButton) {
        showMyViewControllerInACustomizedSheet()
    }
    
    
    func showMyViewControllerInACustomizedSheet() {
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



