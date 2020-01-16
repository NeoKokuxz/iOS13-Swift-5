//
//  WeatherManager.swift
//  Clima
//
//  Created by Naoki on 1/11/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager:WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    let apiKey = "e59a3986c000ba60eedbb0ad476f01d7"
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=imperial"
    
    var delegate : WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let url = "\(weatherURL)&appid=\(apiKey)&q=\(cityName)"
        //        print(cityName) //Test cityName
        //        print(url) //Test url
        
        performRequest(with: url)
    }
    
    func performRequest(with urlString:String){
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
                    self.delegate?.didFailWithError(error: error!)
                    return //exit out the function
                }
                
                if let safeData = data {
                    //Parse safeData into Swift Object
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            } //Closure ends
            
            //Start the task
            //Note: newly-initialized tasks begin in suspended state -> use func resume()
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temp: temp)
            return weather //return weather object
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil //have to set return type WeatherModel to optional?
        }
    }
}

//MARK: - fetchWeather using Lat & Lon
extension WeatherManager {
    func fetchWeather(Latitude: CLLocationDegrees, Longitude: CLLocationDegrees) {
        let url = "\(weatherURL)&appid=\(apiKey)&lat=\(Latitude)&lon=\(Longitude)"
        print(url)
        performRequest(with: url)
    }
}
