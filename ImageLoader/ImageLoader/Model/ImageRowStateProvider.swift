//
//  ImageRowStateProvider.swift
//  ImageLoader
//
//  Created by Anton Grachev on 19/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation

struct ImageRowStateProvider {
    
    // MARK: - Properties
    
    let imageLoaded: Bool
    let isImageLoading: Bool
    
    var state: ImageRow.State {
        if isImageLoading {
            return .progress
        }

        return imageLoaded ? .filled : .empty
    }
    
}
