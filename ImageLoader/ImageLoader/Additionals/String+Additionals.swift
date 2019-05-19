//
//  String+Additionals.swift
//  ImageLoader
//
//  Created by Anton Grachev on 19/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation

extension String {
    
    class Localized {
        
        // MARK: - Errors
        
        static var errorTitle: String {
            return NSLocalizedString("alert.title.error",
                                     tableName: nil,
                                     bundle: Bundle(for: Localized.self),
                                     value: "Error",
                                     comment: "Error title for alert")
        }
        
        static var errorMessageInvalidData: String {
            return NSLocalizedString("error.message.invaliddata",
                                     tableName: nil,
                                     bundle: Bundle(for: Localized.self),
                                     value: "Invalid data received",
                                     comment: "Description for error in image loading case")
        }
        
        // MARK: - Buttons
        
        static var buttonOk: String {
            return NSLocalizedString("button.ok",
                                     tableName: nil,
                                     bundle: Bundle(for: Localized.self),
                                     value: "Ok",
                                     comment: "'Ok' button")
        }
        
        static var buttonCancel: String {
            return NSLocalizedString("button.cancel",
                                     tableName: nil,
                                     bundle: Bundle(for: Localized.self),
                                     value: "Cancel",
                                     comment: "'Cancel' button")
        }
        
        static var buttonLoad: String {
            return NSLocalizedString("button.load",
                                     tableName: nil,
                                     bundle: Bundle(for: Localized.self),
                                     value: "Load",
                                     comment: "'Load' button")
        }
        
        static var buttonIncrement: String {
            return NSLocalizedString("button.increment",
                                     tableName: nil,
                                     bundle: Bundle(for: Localized.self),
                                     value: "Increment",
                                     comment: "'Increment' button")
        }
        
        // MARK: - Labels
        
        static var labelCounter: String {
            return NSLocalizedString("label.counter",
                                     tableName: nil,
                                     bundle: Bundle(for: Localized.self),
                                     value: "Counter:",
                                     comment: "Label for counter")
        }
        
    }
    
}
