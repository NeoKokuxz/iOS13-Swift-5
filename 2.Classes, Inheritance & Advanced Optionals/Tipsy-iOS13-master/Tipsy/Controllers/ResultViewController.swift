//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Naoki on 1/7/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var amount = ""
    var numPPL = 0
    var tipPc = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let newTipPc = Int(tipPc*100)
        // Do any additional setup after loading the view.
        totalAmountLabel.text = amount
        settingLabel.text = "Split between \(numPPL) people, with \(newTipPc)% tip"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
