//
//  CounterStorageImpl.swift
//  ImageLoader
//
//  Created by Anton Grachev on 19/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation

final class CounterStorageImpl: CounterStorage {
    
    // MARK: - Properties
    
    private(set) var count: Int = 0
    
    // MARK: - Public methods
    
    public func increment() {
        count += 1
    }
    
}
