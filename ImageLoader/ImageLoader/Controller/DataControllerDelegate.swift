//
//  DataControllerDelegate.swift
//  ImageLoader
//
//  Created by Anton Grachev on 19/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation

protocol DataControllerDelegate: class {
    
    func reloadRows(at indexPaths: [IndexPath])
    func presentAlertController(title: String?, message: String?)
    
}
