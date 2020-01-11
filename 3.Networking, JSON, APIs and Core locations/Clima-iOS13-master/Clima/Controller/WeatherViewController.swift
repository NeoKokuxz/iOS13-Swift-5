//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self //Self refer to current viewcontroller
        
    }


    @IBAction func searchPressed(_ sender: UIButton) {
        print(searchTextField.text!)
        view.endEditing(true) //dismiss keyboard
    }
    
    //keyboard return triggered
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        view.endEditing(true) //dismiss keyboard
        return true
    }
    
    //Dismiss keyboard condition
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //dismiss if no input
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Search"
            return false
        }
    }
    
    //Clear textfield when done typing
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = ""
    }
}

