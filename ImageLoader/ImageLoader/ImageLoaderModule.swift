//
//  ImageLoaderModule.swift
//  ImageLoader
//
//  Created by Anton Grachev on 19/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation

// MARK: - Storyboard

public extension UIStoryboard {
    
    static var imageLoaderStoryboard: UIStoryboard {
        return UIStoryboard(name: "ImageLoaderStoryboard",
                            bundle: Bundle(for: ImageLoaderViewController.self))
    }
    
}

// MARK: - ViewController

public extension UIViewController {
    
    static var imageLoaderViewController: UIViewController? {
        return UIStoryboard.imageLoaderStoryboard.instantiateViewController(withIdentifier: "ImageLoaderViewController")
    }
    
}


