//
//  WeatherManager.swift
//  Clima
//
//  Created by Naoki on 1/11/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func updateWeather(weather: WeatherModel)
}

struct WeatherManager {
    
    let apiKey = "e59a3986c000ba60eedbb0ad476f01d7"
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=imperial"
    
    var delegate : WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let url = "\(weatherURL)&appid=\(apiKey)&q=\(cityName)"
        //        print(cityName) //Test cityName
        //        print(url) //Test url
        
        performRequest(urlString: url)
    }
    
    func performRequest(urlString:String){
        //Create URL
        if let url = URL(string: urlString) {
            //Create URL Session
            let session = URLSession(configuration: .default) //Use default configuration
            //Give session a task
            //CompletionHandler:
            let task = session.dataTask(with: url) { (data, response, error) in
                //Inside closure:
                if error != nil {
                    print("Error!")
                    print(error!)
                    return //exit out the function
                }
                
                if let safeData = data {
                    //Parse safeData into Swift Object
                    if let weather = self.parseJSON(weatherData: safeData){
                        self.delegate?.updateWeather(weather: weather)
                    }
                }
            } //Closure ends
    
            //Start the task
            //Note: newly-initialized tasks begin in suspended state -> use func resume()
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temp: temp)
            return weather //return weather object
            
        } catch {
            print(error)
            return nil //have to set return type WeatherModel to optional?
        }
    }
}

