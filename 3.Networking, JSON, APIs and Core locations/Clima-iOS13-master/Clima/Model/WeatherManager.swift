//
//  WeatherManager.swift
//  Clima
//
//  Created by Naoki on 1/11/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = ""
    
    func fetchWeather(cityName: String) {
        let url = "\(weatherURL)&q=\(cityName)"
        print(cityName) //Test cityName
    }
}
