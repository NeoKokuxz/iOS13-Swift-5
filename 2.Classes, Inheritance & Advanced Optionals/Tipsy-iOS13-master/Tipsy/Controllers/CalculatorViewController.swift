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
    var getBillText = ""
    var numPPL = 1
    var finalAmount = ""
    var billAmountNumber = 0.0

    
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
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumBtn.text = String(format: "%.0f", sender.value)
        numPPL = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let getBill = billTextField.text!
        if getBill != "" {
            billAmountNumber = Double(getBill)!
        }
        //Convert textfield string into double
        
        //Calculate struct for user input
        let calculatetip = calculateTip(tipPc: tipPc, amount: billAmountNumber, numPeople: numPPL)
        
        //Calculate totalAmount
        let totalAmount = billAmountNumber + calculatetip.TipAmount()
                
        //Store formatted amount and prepare to pass data
        finalAmount = String(format: "%.2f", calculatetip.splitAmount(total: totalAmount))
        
        //Segue "passData"
        performSegue(withIdentifier: "passData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        
        destinationVC.amount = finalAmount
        destinationVC.numPPL = numPPL
        destinationVC.tipPc = tipPc
    }
    
    @IBAction func dissTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
}

