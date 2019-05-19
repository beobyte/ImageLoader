//
//  InputRow.swift
//  ImageLoader
//
//  Created by Anton Grachev on 18/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation

struct InputRow {
    
    // MARK: - Properties
    
    let urlString: String?
    let placeholder = "Enter url of image"
    
    // MARK: - Compare operator
    
    static func ==(lhs: InputRow, rhs: InputRow) -> Bool {
        return lhs.urlString == rhs.urlString
    }
    
}
