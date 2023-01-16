//
//  WeatherEngine.swift
//  Simple Weather
//
//  Created by Furkan Gençoğulları on 12.01.2023.
//

import Foundation
import CoreLocation

struct WeatherEngine {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=cf8dbeb7aa0cb49ab726d7a1c3a8ed74&units=metric"
    
    func getWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func getWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon\(longitude)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    
                    return
                }
                if let safeData = data {
                    let weather = parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let weather = WeatherData(name: decodedData.name, main: decodedData.main, wind: decodedData.wind, sys: decodedData.sys)
            
            return weather
            
        } catch {
            print("ERROR \n Decoder")
        }
        return nil
    }
    
    
    
    
    
    
    
    
}
