//
//  CounterCell.swift
//  ImageLoader
//
//  Created by Anton Grachev on 18/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import UIKit

class CounterCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var counterLabel: UILabel!
    
    static var reuseIdentifier: String {
        return String(describing: CounterCell.self)
    }
    
    // MARK: - Public methods
    
    public func configure(description: String, count: String) {
        descriptionLabel.text = description
        counterLabel.text = count
    }

}
