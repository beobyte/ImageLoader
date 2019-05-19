//
//  NavigationController.swift
//  ImageLoaderExample
//
//  Created by Anton Grachev on 19/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import UIKit
import ImageLoader

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let viewController = UIViewController.imageLoaderViewController {
            pushViewController(viewController, animated: true)
        }
    }

}
