//
//  Weather.swift
//  Simple Weather
//
//  Created by Furkan Gençoğulları on 13.01.2023.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let wind: Wind
    let sys: Sys
}

struct Main: Codable {
    let temp: Double
    let pressure: Int
    let humidity: Int
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
}

struct Sys: Codable {
    let sunrise: Int
    let sunset: Int
}
