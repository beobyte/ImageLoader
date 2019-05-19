//
//  InputCell.swift
//  ImageLoader
//
//  Created by Anton Grachev on 18/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import UIKit

class InputCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet private weak var textField: UITextField!
    
    static var reuseIdentifier: String {
        return String(describing: InputCell.self)
    }
    
    var inputText: String? {
        return textField.text
    }
    
    // MARK: - Public methods
    
    public func configure(text: String?, placeholder: String?) {
        textField.text = text
        textField.placeholder = placeholder
    }

}
