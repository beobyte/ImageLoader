//
//  ImageRow.swift
//  ImageLoader
//
//  Created by Anton Grachev on 18/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation
import UIKit

struct ImageRow {
    
    // MARK: - Inner types
    
    enum State {
        case empty
        case progress
        case filled
    }
    
    // MARK: - Properties
    
    let state: State
    let placeholder: UIImage
    private(set) var image: UIImage?
    
    var isLoading: Bool {
        return state == .progress
    }
    
    var currentImage: UIImage? {
        switch state {
        case .empty:
            return placeholder
            
        case .filled:
            return image
            
        case .progress:
            return nil
        }
    }
    
    // MARK: - Compare operator
    
    static func ==(lhs: ImageRow, rhs: ImageRow) -> Bool {
        return lhs.state == rhs.state
    }
    
}
