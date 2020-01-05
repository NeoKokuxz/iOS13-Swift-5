//
//  CalculateMethods.swift
//  BMI Calculator
//
//  Created by Naoki on 12/30/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateMethods {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height:Float, weight:Float) {
        let BMIValue = (weight * 703) / pow((height*39.37), 2)
        
        //If statement auto checks lower bound
        if BMIValue < 18.5 {
            print("Under weight")
            bmi = BMI(value: BMIValue, advice: "Eat more snacks!", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        } else if BMIValue < 24.9 {
            print("Normal weight")
            bmi = BMI(value: BMIValue, advice: "Keep it up!", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        } else {
            print("Over weight")
            bmi = BMI(value: BMIValue, advice: "Do more workout!", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        }
    }
    
    func getBMI() -> String {
        let getBMIValue = String(format: "%.2f", bmi?.value ?? 0.0)
        return getBMIValue
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
