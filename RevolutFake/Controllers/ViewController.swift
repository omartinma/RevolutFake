//
//  ViewController.swift
//  RevolutFake
//
//  Created by Oscar Martín on 27/06/2019.
//  Copyright © 2019 Oscar Martín. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var totalAmountLabel: UILabel!
    var transactions: [Transaction] = []
    var sections: [MonthSection] = []
    
    // MARK: Functions for TableView
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        let section = self.sections[section]
        return section.transactions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //Calculate the header text
        let section = self.sections[section]
        let date = section.month
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        let text = dateFormatter.string(from: date)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionHeaderTableViewCell") as? TransactionHeaderTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TransactionTableViewCell.")
        }
        cell.DateHeaderLabel.text = text
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "TransactionTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TransactionTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TransactionTableViewCell.")
        }
        
        let section = self.sections[indexPath.section]
        let transaction = section.transactions[indexPath.row]
        
        cell.conceptLabel.text = transaction.concept
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, HH.mm"
        cell.dateLabel.text = formatter.string(from: transaction.date)
        
        return cell
    }
    
    // Mark: Privates
    fileprivate func firstDayOfMonth(date : Date) -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    
    // Mark: Inits
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadTotalAmount()
        loadTransactions()
        loadSections()
    }
    
    func loadSections(){
        let groups = Dictionary(grouping: self.transactions) { (transaction) in
            return firstDayOfMonth(date: transaction.date)
        }
        self.sections = groups.map(MonthSection.init(month:transactions:)).sorted()
    }
    
    func loadTransactions(){
        let trans1 = Transaction(concept: "Libro", date: Date())
        let trans2 = Transaction(concept: "Libro2", date: Date())
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let date3 = formatter.date(from: "01.06.2019") ?? Date()
        let trans3 = Transaction(concept: "Libro3", date: date3)
        
        
        transactions = [trans1,trans2,trans3]
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

