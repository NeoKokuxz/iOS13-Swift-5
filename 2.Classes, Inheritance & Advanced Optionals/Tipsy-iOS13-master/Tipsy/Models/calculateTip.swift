//
//  calculateTip.swift
//  Tipsy
//
//  Created by Naoki on 1/8/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct calculateTip {
    var tipPc:Double
    var amount:Double
    var numPeople:Int
    
    func TipAmount() -> Double{
        let tipAmount = tipPc * amount
        return tipAmount
    }
    
    func splitAmount(total:Double) -> Double {
        let amount = total / Double(numPeople)
        return amount
    }
}
