//
//  Weather.swift
//  Simple Weather
//
//  Created by Furkan Gençoğulları on 16.01.2023.
//

import Foundation

struct WeatherModel {

    let cityName: String
    
    let temperature: Double
    var temperatureString: String {return "\(String(format: "%.1f", temperature))°"}
    
    let conditionId: Int
    var conditionName: String {
        switch conditionId {
        case 200 ... 232:
            return "Thunderstorm"
        case 300 ... 321:
            return "Drizzle"
        case 500 ... 531:
            return "Rain"
        case 600 ... 622:
            return "Snow"
        case 800:
            return "Clear"
        case 801 ... 804:
            return "Clouds"
        default:
            return "no weather data"
        }
    }
    var conditionImage: String {
        switch conditionId {
        case 200 ... 232:
            return "cloud.bolt"
        case 300 ... 321:
            return "cloud.drizzle"
        case 500 ... 531:
            return "cloud.rain"
        case 600 ... 622:
            return "cloud.snow"
        case 800:
            return "sun.max.fill"
        case 801 ... 804:
            return "cloud"
        default:
            return "no weather data"
        }
    }
    
    let sunrise: Double
    var sunriseString: String {
        let myTime = Date(timeIntervalSince1970: sunrise)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        return dateFormatter.string(from: myTime)
    }
    
    let sunset: Double
    var sunsetString: String {
        let myTime = Date(timeIntervalSince1970: sunset)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        return dateFormatter.string(from: myTime)
    }
    
    let airPressure: Int
    var airPressureString: String {return "\(airPressure) hPa"}
    
    let humidity: Int
    var humidityString: String {return "%\(humidity)"}
    
    let windSpeed: Double
    var windSpeedString: String {return "\(windSpeed) m/s"}
    
    let windDirection: Int
    var windDirectionString: String {return "\(windDirection)°"}
}


