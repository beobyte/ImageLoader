//
//  ButtonsCell.swift
//  ImageLoader
//
//  Created by Anton Grachev on 18/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import UIKit

class ButtonsCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet private weak var loadButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var incrementButton: UIButton!
    
    static var reuseIdentifier: String {
        return String(describing: ButtonsCell.self)
    }
    
    // MARK: - Public methods
    
    public func configure(loadButtonTitle: String,
                          cancelButtonTitle: String,
                          incrementButtonTitle: String,
                          loadButtonEnabled: Bool,
                          cancelButtonEnabled: Bool,
                          incrementButtonEnabled: Bool) {
        loadButton.setTitle(loadButtonTitle, for: .normal)
        cancelButton.setTitle(cancelButtonTitle, for: .normal)
        incrementButton.setTitle(incrementButtonTitle, for: .normal)
        loadButton.isEnabled = loadButtonEnabled
        cancelButton.isEnabled = cancelButtonEnabled
        incrementButton.isEnabled = incrementButtonEnabled
    }

}
