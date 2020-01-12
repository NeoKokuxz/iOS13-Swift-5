//
//  WeatherManager.swift
//  Clima
//
//  Created by Naoki on 1/11/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    let apiKey = "e59a3986c000ba60eedbb0ad476f01d7"
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?units=imperial"
    
    func fetchWeather(cityName: String) {
        let url = "\(weatherURL)&appid=\(apiKey)&q=\(cityName)"
        print(cityName) //Test cityName
        print(url) //Test url
    }
}
