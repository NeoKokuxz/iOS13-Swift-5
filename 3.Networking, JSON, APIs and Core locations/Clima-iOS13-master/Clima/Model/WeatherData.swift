//
//  WeatherData.swift
//  Clima
//
//  Created by Naoki on 1/14/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

//Property name have to match the one on JSON file
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather] //Create array Weather type
}

struct Main: Codable {
    let temp:Double
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
