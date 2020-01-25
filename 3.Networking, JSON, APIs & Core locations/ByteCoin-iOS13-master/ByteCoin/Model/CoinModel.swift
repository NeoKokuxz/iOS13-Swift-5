//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Naoki on 1/22/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let price:Double
    let currencyName:String
    
    var priceString:String{
        return String(format: "%.1f", price)
    }
}
