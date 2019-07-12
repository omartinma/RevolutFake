//
//  MonthSection.swift
//  RevolutFake
//
//  Created by Oscar Martín on 13/07/2019.
//  Copyright © 2019 Oscar Martín. All rights reserved.
//

import Foundation

struct MonthSection : Comparable {
    
    var month : Date
    var transactions : [Transaction]
    
    static func < (lhs: MonthSection, rhs: MonthSection) -> Bool {
        return lhs.month < rhs.month
    }
    
    static func == (lhs: MonthSection, rhs: MonthSection) -> Bool {
        return lhs.month == rhs.month
    }
}
