//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currencyValue: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var pickerLabel: UIPickerView!
    
    var coinManager = CoinManager() //Initialize coinManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pickerLabel.dataSource = self //Set picker data source to current ViewController
        pickerLabel.delegate = self //Set picker delegate to current ViewController
        
        coinManager.delegate = self //Set custom coinManager delegate to update currencyValue label
    }
}

//MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //return number of columns in picker
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count //return number of rows in picker
    }
}

//MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row] //Check current currency label in the array
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currencyName = coinManager.currencyArray[row]
        currencyLabel.text = currencyName
        coinManager.getCurrencyPrice(for: currencyName)
    }
}

//MARK: - CoinManagerDelegate
extension ViewController: CoinManagerDelegate {
    func didFailWithError(with error: Error) {
        print(error)
    }
    
    func didUpdateWithPrice(_ price: String) {
        DispatchQueue.main.async {
            self.currencyValue.text = price
        }
    }
}
