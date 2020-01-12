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
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=imperial"
    
    func fetchWeather(cityName: String) {
        let url = "\(weatherURL)&appid=\(apiKey)&q=\(cityName)"
        print(cityName) //Test cityName
        print(url) //Test url
        
        performRequest(urlString: url)
    }
    
    func performRequest(urlString:String){
        //Create URL
        if let url = URL(string: urlString) {
            //Create URL Session
            let session = URLSession(configuration: .default) //Use default configuration
            //Give session a task
            //CompletionHandler:
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:)) //Return URLSessionDataTask
            //Start the task
            //Note: newly-initialized tasks begin in suspended state -> use func resume()
            task.resume()
        }
    }
    
    //This function handle the completion data
    func handle(data:Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print("Error!")
            print(error!)
            return //exit out the function
        }
        
        if let safeData = data {
            //print data will not show the data itself, we have to turn it into string
            let dataString = String(data: safeData, encoding: .utf8) //utf8 is standard encoding on web
            print(dataString!)
        }
    }
}

