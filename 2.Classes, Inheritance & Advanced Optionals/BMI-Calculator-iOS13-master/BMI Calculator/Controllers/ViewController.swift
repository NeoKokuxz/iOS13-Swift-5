//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Use the struct from Models folder
    var calculator = CalculateMethods()
    
    //Display label for height and weight
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    //Current value for both height and weight slider
    @IBOutlet weak var heightSliderValue: UISlider!
    @IBOutlet weak var weightSliderValue: UISlider!
    
    var BMIValue:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value) + "m"
    }
    @IBAction func weightSliderChange(_ sender: UISlider) {
        weightLabel.text = String(format: "%.0f", sender.value) + "lb"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSliderValue.value
        let weight = weightSliderValue.value
        
        calculator.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "calculateSeg", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "calculateSeg" {
            let destinatVC = segue.destination as! ResultViewViewController
            destinatVC.resultValue = calculator.getBMI()
            destinatVC.resultAdvice = calculator.getAdvice()
            destinatVC.resultColor = calculator.getColor()
        }
    }
}

