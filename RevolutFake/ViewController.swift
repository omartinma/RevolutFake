//
//  ViewController.swift
//  RevolutFake
//
//  Created by Oscar Martín on 27/06/2019.
//  Copyright © 2019 Oscar Martín. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalAmountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         loadTotalAmount()
       
    }

    func loadTotalAmount(){
        let currency = "€"
        let mainAmount = "600"
        let decimalSeparator = "."
        let decimalAmount = "00"
        let amountText = NSMutableAttributedString.init(string: currency+mainAmount+decimalSeparator+decimalAmount)
        
// Set currency
        amountText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40),
                                  NSAttributedString.Key.foregroundColor: UIColor.black],
                                 range: NSMakeRange(0, 1))
// Set main number
        
        amountText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 38),
                                  NSAttributedString.Key.foregroundColor: UIColor.black],
                                 range: NSMakeRange(1, mainAmount.count))
        // Set decimal separator
        
        amountText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30),
                                  NSAttributedString.Key.foregroundColor: UIColor.black],
                                 range: NSMakeRange(currency.count+mainAmount.count, 1))
        
        
        // Set decimal number
        amountText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),
                                  NSAttributedString.Key.foregroundColor: UIColor.black],
                                 range: NSMakeRange(currency.count+mainAmount.count + decimalSeparator.count, decimalAmount.count))
        // set the attributed string to the UILabel object
        totalAmountLabel.attributedText = amountText
    }

}

