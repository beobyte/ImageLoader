//
//  ImageLoaderImpl.swift
//  ImageLoader
//
//  Created by Anton Grachev on 19/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation
import UIKit

final class ImageLoaderImpl: ImageLoader {    
    
    // MARK: - Inner types
    
    enum Error: Int {
        case unknown
        case invalidData
        
        var userInfo: [String : Any]? {
            switch self {
            case .invalidData:
                return [NSLocalizedDescriptionKey: String.Localized.errorMessageInvalidData]
            default:
                return nil
            }
        }
    }
    
    // MARK: - Properties
    
    static let errorDomain = "ImageLoaderErrorDomain"
    
    private let session = URLSession(configuration: .default)
    private var task: URLSessionTask?
    
    // MARK: - Internal methods
    
    func loadImage(from url: URL, completion: @escaping (UIImage?, Swift.Error?) -> (Void)) {
        task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                let nsError = error! as NSError
                let isCancelledError = (nsError.domain == NSURLErrorDomain && nsError.code == NSURLErrorCancelled)
                completion (nil, isCancelledError ? nil : error)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                let error = NSError(domain: ImageLoaderImpl.errorDomain,
                                    code: Error.invalidData.rawValue,
                                    userInfo: Error.invalidData.userInfo)
                completion (nil, error)
                return
            }
            
            completion(image, nil)
        }
        task?.resume()
    }
    
    func cancelImageLoading() {
        task?.cancel()
    }
    
}
