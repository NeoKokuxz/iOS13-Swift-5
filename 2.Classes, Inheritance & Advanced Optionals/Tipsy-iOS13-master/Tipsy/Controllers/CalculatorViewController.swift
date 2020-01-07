//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroBtn: UIButton!
    @IBOutlet weak var tenBtn: UIButton!
    @IBOutlet weak var twentyBtn: UIButton!
    @IBOutlet weak var splitNumBtn: UILabel!
    
    var tipPc = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tipChanged(_ sender: UIButton) {
        zeroBtn.isSelected = false
        tenBtn.isSelected = false
        twentyBtn.isSelected = false
        
        //This capture the current selection of tip %
        sender.isSelected = true

        //Return 0% 10% and 20% base on selection
        let currentBtn = sender.currentTitle!
        
        //Drop the last % from the currentBtn title
        let currentPc = String(currentBtn.dropLast())
        
        let currentPcNumber = Double(currentPc)! / 100
                
        tipPc = currentPcNumber
        
        print(tipPc)

        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        print(tipPc)
    }
}

