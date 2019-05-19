//
//  Bundle+Additionals.swift
//  ImageLoader
//
//  Created by Anton Grachev on 19/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation

extension Bundle {
    
    static var imageLoaderBundle: Bundle {
        return Bundle(for: ImageLoaderViewController.self)
    }
    
}
