//
//  ImageCell.swift
//  ImageLoader
//
//  Created by Anton Grachev on 18/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import UIKit

final class ImageCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var imgView: UIImageView!
    
    static var reuseIdentifier: String {
        return String(describing: ImageCell.self)
    }

    // MARK: - Public methods
    
    public func configure(isLoading: Bool, image: UIImage?) {
        if (isLoading) {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            imgView.isHidden = true
        } else {
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            imgView.image = image
        }
        
    }

}
