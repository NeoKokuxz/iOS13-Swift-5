//
//  ResultViewViewController.swift
//  BMI Calculator
//
//  Created by Naoki on 12/29/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultAdviceLabel: UILabel!
    
    var resultValue:String?
    var resultAdvice:String?
    var resultColor:UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        resultLabel.text = resultValue
        view.backgroundColor = resultColor
        resultAdviceLabel.text = resultAdvice
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
