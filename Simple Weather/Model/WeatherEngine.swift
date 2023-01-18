//
//  WeatherEngine.swift
//  Simple Weather
//
//  Created by Furkan Gençoğulları on 12.01.2023.
//

import Foundation
import CoreLocation

protocol WeatherEngineDelegate {
    func didUpdateWeather(weather: WeatherModel)
    func didFinishWithError(error: Error)
}

protocol WeatherEngineDelegate2 {
    func didUpdateWeather(weather: WeatherModel)
    func didFinishWithError(error: Error)
}

struct WeatherEngine {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=cf8dbeb7aa0cb49ab726d7a1c3a8ed74&units=metric"
    
    var delegate: WeatherEngineDelegate?
    var delegate2: WeatherEngineDelegate2?
    
    func getWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func getWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        print(urlString)
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
                    if let weather = parseJSON(weatherData: safeData) {
                        delegate?.didUpdateWeather(weather: weather)
                        delegate2?.didUpdateWeather(weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let weather = WeatherModel(cityName: decodedData.name,
                                       temperature: decodedData.main.temp,
                                       conditionId: decodedData.weather[0].id,
                                       sunrise: decodedData.sys.sunrise,
                                       sunset: decodedData.sys.sunset,
                                       airPressure: decodedData.main.pressure,
                                       humidity: decodedData.main.humidity,
                                       windSpeed: decodedData.wind.speed,
                                       windDirection: decodedData.wind.deg)
            return weather
        } catch {
            print("ERROR \n Decoder")
        }
        return nil
    }
}


