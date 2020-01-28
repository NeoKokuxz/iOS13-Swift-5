//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. xAll rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }//End of viewDidLoad
    
    //Refresh text whenever view become available
    override func viewDidAppear(_ animated: Bool) {
//        titleLabel.text = ""
//        let titleText = "⚡️FlashChat"
//        var charCount = 0
//        for letter in titleText {
//            //Timer setup
//            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(charCount), repeats: false) { (timer) in
//                self.titleLabel.text?.append(letter)
//            }//End of timer
//            charCount += 1
//        }
        titleLabel.text = "⚡️FlashChat"
    }
}//End of VC
