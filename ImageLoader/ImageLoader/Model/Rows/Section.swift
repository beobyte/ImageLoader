//
//  Section.swift
//  ImageLoader
//
//  Created by Anton Grachev on 18/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation

struct Section {
    
    // MARK: - Inner types
    
    enum RowType {
        case image(row: ImageRow)
        case input(row: InputRow)
        case counter(row: CounterRow)
        case buttons(row: ButtonsRow)
        
        // MARK: - Compare operator
        
        static func ==(lhs: RowType, rhs: RowType) -> Bool {
            switch (lhs, rhs) {
            case let (.image(row: a), .image(row: b)):
                return a == b
            case let (.input(row: a), .input(row: b)):
                return a == b
            case let (.counter(row: a), .counter(row: b)):
                return a == b
            case let (.buttons(row: a), .buttons(row: b)):
                return a == b
            default:
                return false
            }
        }
    }
    
    // MARK: - Properties
    
    let rows: [RowType]
}
