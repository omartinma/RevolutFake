//
//  ViewController.swift
//  RevolutFake
//
//  Created by Oscar Martín on 27/06/2019.
//  Copyright © 2019 Oscar Martín. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
                // Table view cells are reused and should be dequeued using a cell identifier.
                let cellIdentifier = "TransactionTableViewCell"
        
                guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TransactionTableViewCell  else {
                    fatalError("The dequeued cell is not an instance of TransactionTableViewCell.")
                }
        
                // Fetches the appropriate meal for the data source layout.
                let transaction = transactions[indexPath.row]
        
                cell.conceptLabel.text = transaction
        
        
                return cell
    }
    
    
    var transactions: [String] = []
    
    // MARK: - Table view data source
    @IBOutlet weak var myTableView: UITableView!
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return transactions.count
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // Table view cells are reused and should be dequeued using a cell identifier.
//        let cellIdentifier = "TransactionTableViewCell"
//        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TransactionTableViewCell  else {
//            fatalError("The dequeued cell is not an instance of TransactionTableViewCell.")
//        }
//        
//        // Fetches the appropriate meal for the data source layout.
//        let transaction = transactions[indexPath.row]
//        
//        cell.conceptLabel.text = transaction
//
//        
//        return cell
//    }
    

    @IBOutlet weak var totalAmountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         loadTotalAmount()
       transactions = ["Atletico de Madrid", "Barcelona", "Deportivo de la Coruña", "Las Palmas", "Malaga", "Rayo Vallecano", "Sporting", "Real Sociedad", "Espanyol", "Mallorca", "Valladolid", "Eibar",  "Ponferradina", "Albacete"]
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

