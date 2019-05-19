//
//  ButtonsStateProvider.swift
//  ImageLoader
//
//  Created by Anton Grachev on 18/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation

struct ButtonsStateProvider {
    
    // MARK: - Properties
    
    let counterValue: Int
    let isImageLoading: Bool
    let isImageUrlEmpty: Bool
    let isImageUrlChanged: Bool
    
    var isLoadButtonEnabled: Bool {
        return isCounterDependentButtonEnabled() && !isImageLoading && !isImageUrlEmpty && isImageUrlChanged
    }
    
    var isCancelButtonEnabled: Bool {
        return isCounterDependentButtonEnabled() && isImageLoading
    }
    
    var isIncrementButtonEnabled: Bool {
        return true
    }
    
    // MARK: - Private methods
    
    private func isCounterDependentButtonEnabled() -> Bool {
        return (counterValue == 0) || (counterValue % 2) != 0
    }
    
}
