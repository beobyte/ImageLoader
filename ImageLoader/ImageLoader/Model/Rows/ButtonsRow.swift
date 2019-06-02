//
//  ButtonsRow.swift
//  ImageLoader
//
//  Created by Anton Grachev on 18/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation

struct ButtonsRow: Equatable {
    
    // MARK: - Properties
    
    let loadButtonTitle: String
    let cancelButtonTitle: String
    let incrementButtonTitle: String
    
    let isLoadButtonEnabled: Bool
    let isCancelButtonEnabled: Bool
    let isIncrementButtonEnabled: Bool
    
}
