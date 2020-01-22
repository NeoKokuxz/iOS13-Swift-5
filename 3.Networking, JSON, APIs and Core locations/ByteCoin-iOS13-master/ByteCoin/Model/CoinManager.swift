//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateWithPrice(_ price:String)
    func didFailWithError(with: Error)
}

struct CoinManager {
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate : CoinManagerDelegate?
    
    //Get currency price
    func getCurrencyPrice(for currency: String) {
        let finalURL = baseURL + currency
        
        //print(finalURL)
        self.performRequest(with: finalURL)
    }
    
    //perform API request to get JSON data
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(with: error!)
                    return
                }
                if let safeData = data {
                    //print("success!")
                    let price = self.parseJSON(with: safeData)
                    let lastPrice = String(format: "%.1f", price!)
                    //use protocol to update the last price
                    self.delegate?.didUpdateWithPrice(lastPrice)
                }
            }
            task.resume()
        }
    }
    
    //Decode JSON data
    func parseJSON(with data: Data) -> Double? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.last
            return lastPrice
        } catch {
            return nil
        }
    }
}
