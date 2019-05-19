//
//  CounterRow.swift
//  ImageLoader
//
//  Created by Anton Grachev on 18/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation

struct CounterRow {
    
    // MARK: - Properties
    
    let count: Int
    let counterDescription: String
    
    // MARK: - Compare operator
    
    static func ==(lhs: CounterRow, rhs: CounterRow) -> Bool {
        return lhs.count == rhs.count && lhs.counterDescription == rhs.counterDescription
    }
    
}
