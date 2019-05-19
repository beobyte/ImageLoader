//
//  ButtonsRow.swift
//  ImageLoader
//
//  Created by Anton Grachev on 18/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation

struct ButtonsRow {
    
    // MARK: - Properties
    
    let loadButtonTitle: String
    let cancelButtonTitle: String
    let incrementButtonTitle: String
    
    let isLoadButtonEnabled: Bool
    let isCancelButtonEnabled: Bool
    let isIncrementButtonEnabled: Bool
    
    // MARK: - Compare operator
    
    static func ==(lhs: ButtonsRow, rhs: ButtonsRow) -> Bool {
        return lhs.isLoadButtonEnabled == rhs.isLoadButtonEnabled
            && lhs.isCancelButtonEnabled == rhs.isCancelButtonEnabled
            && lhs.isIncrementButtonEnabled == rhs.isIncrementButtonEnabled
            && lhs.loadButtonTitle == rhs.loadButtonTitle
            && lhs.cancelButtonTitle == rhs.cancelButtonTitle
            && lhs.incrementButtonTitle == rhs.incrementButtonTitle
    }
    
}
