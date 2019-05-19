//
//  ImageLoader.swift
//  ImageLoader
//
//  Created by Anton Grachev on 19/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation
import UIKit

protocol ImageLoader {
    
    func loadImage(from url: URL, completion: @escaping (UIImage?, Error?) -> (Void))
    func cancelImageLoading()
    
}
