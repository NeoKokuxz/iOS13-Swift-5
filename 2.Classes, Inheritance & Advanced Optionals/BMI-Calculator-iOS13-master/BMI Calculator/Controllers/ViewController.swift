//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Display label for height and weight
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    //Current value for both height and weight slider
    @IBOutlet weak var heightSliderValue: UISlider!
    @IBOutlet weak var weightSliderValue: UISlider!
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
        performSegue(withIdentifier: "calculateSeg", sender: self)
        let height = heightSliderValue.value
        let weight = weightSliderValue.value
        
        let BMI = String(format: "%.2f", (weight * 703) / pow((height*39.37), 2))
        
    }
}

