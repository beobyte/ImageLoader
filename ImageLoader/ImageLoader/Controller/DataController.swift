//
//  DataController.swift
//  ImageLoader
//
//  Created by Anton Grachev on 18/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation
import UIKit

protocol DataController: class {
    
    var delegate: DataControllerDelegate? { get set }
    
    func loadImage()
    func cancelImageLoading()
    func incrementCounter()
    func updateImageUrl(with string: String?)
    
    func numberOfRowsInSection(_ section: Int) -> Int
    func rowForIndexPath(_ indexPath: IndexPath) -> Section.RowType
}
