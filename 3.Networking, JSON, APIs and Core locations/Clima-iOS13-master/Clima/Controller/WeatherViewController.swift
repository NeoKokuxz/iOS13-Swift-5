//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

//MARK: - WeatherViewController
class WeatherViewController: UIViewController{
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager() //Holds current GPS location
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self //Self refer to current viewcontroller
        weatherManager.delegate = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization() //Request permission to use location
        locationManager.requestLocation() //Request user location once -For GPS apps -> use startUpdatingLocation()
    }
    
    
    
}

//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        view.endEditing(true) //dismiss keyboard
    }
    
    //keyboard return triggered
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //        weatherManager.fetchWeather(cityName: searchTextField.text!)
        view.endEditing(true) //dismiss keyboard
        return true
    }
    
    //Dismiss keyboard condition
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //dismisskeyboard
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Search"
            return true
        }
    }
    
    //Clear textfield when done typing
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate
extension WeatherViewController : WeatherManagerDelegate {
    //Delegate method
    func didUpdateWeather(_ weatherManager:WeatherManager, weather: WeatherModel) {
        //update current weather
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.tempString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWithError(error: Error) {
        //report Error
        print(error)
    }
    
}

//MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()//Stop update location in order to request location later on
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
//            print(lat, long)
            weatherManager.fetchWeather(Latitude: lat, Longitude: long)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    @IBAction func getCurrentWeatherPressed(_ sender: UIButton) {
        locationManager.requestLocation() //Re-request location upon stop location above
    }
}
