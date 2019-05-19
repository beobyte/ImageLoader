//
//  ImageUrlProvider.swift
//  ImageLoader
//
//  Created by Anton Grachev on 19/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation

struct ImageUrlProvider {
    
    // MARK: - Properties
    
    let imageUrlString: String?
    var imageUrl: URL? {
        guard let string = imageUrlString else {
            return nil
        }
        return URL(string: string)
    }
    var lastSuccessfullyLoadedUrl: URL?
    var isUrlChangedFromLastSuccessfullyLoad: Bool {
        guard let lastUrl = lastSuccessfullyLoadedUrl else {
            return true
        }
        return imageUrl != lastUrl
    }
    
    // MARK: - Factory method
    
    static func `default`() -> ImageUrlProvider {
        let defaultUrlString = "https://placekitten.com/300/250"
        return ImageUrlProvider(imageUrlString: defaultUrlString,
                                lastSuccessfullyLoadedUrl: nil)
    }
    
}
