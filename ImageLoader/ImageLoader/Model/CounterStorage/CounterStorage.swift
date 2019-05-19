//
//  CounterStorage.swift
//  ImageLoader
//
//  Created by Anton Grachev on 18/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation

protocol CounterStorage {
    
    var count: Int { get }
    func increment()
    
}
