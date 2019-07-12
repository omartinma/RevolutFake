//
//  Transaction.swift
//  RevolutFake
//
//  Created by Oscar Martín on 12/07/2019.
//  Copyright © 2019 Oscar Martín. All rights reserved.
//

import Foundation

public class Transaction{
    let concept : String
    let date : Date
    
    init(concept:String, date:Date){
        self.concept = concept
        self.date = date
    }
    
}
