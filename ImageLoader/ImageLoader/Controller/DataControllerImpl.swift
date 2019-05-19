//
//  DataControllerImpl.swift
//  ImageLoader
//
//  Created by Anton Grachev on 18/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation
import UIKit

final class DataControllerImpl: NSObject, DataController {
    
    // MARK: - Properties
    
    weak var delegate: DataControllerDelegate?
    
    private lazy var mainSection = createSection()
    
    private let counterStorage: CounterStorage
    private let imageLoader: ImageLoader
    private var imageUrlProvider: ImageUrlProvider
    
    private var isImageLoading = false
    private var image: UIImage?
    
    // MARK: - Init
    
    init(counterStorage: CounterStorage, imageLoader: ImageLoader, imageUrlProvider: ImageUrlProvider) {
        self.counterStorage = counterStorage
        self.imageLoader = imageLoader
        self.imageUrlProvider = imageUrlProvider
        super.init()
    }
    
    // MARK: - Public methods
    
    func loadImage() {
        guard let imageUrl = imageUrlProvider.imageUrl else {
            return
        }
        
        isImageLoading = true
        reloadRowsIfNeeded()
        
        imageLoader.loadImage(from: imageUrl) { [weak self] (image, error) -> (Void) in
            DispatchQueue.main.async {
                guard let this = self else {
                    return
                }
                
                defer {
                    this.image = image
                    this.isImageLoading = false
                    this.reloadRowsIfNeeded()
                }
                
                
                if (error != nil) {
                    this.delegate?.presentAlertController(title: String.Localized.errorTitle,
                                                          message: error?.localizedDescription)
                    return
                }
                
                if (image != nil) {
                    this.imageUrlProvider = ImageUrlProvider(imageUrlString: this.imageUrlProvider.imageUrlString,
                                                             lastSuccessfullyLoadedUrl: imageUrl)
                }
            }
        }
    }
    
    func cancelImageLoading() {
        imageLoader.cancelImageLoading()
        reloadRowsIfNeeded()
    }
    
    func incrementCounter() {
        counterStorage.increment()
        reloadRowsIfNeeded()
    }
    
    func updateImageUrl(with string: String?) {
        let updatedUrlProvider = ImageUrlProvider(imageUrlString: string,
                                                  lastSuccessfullyLoadedUrl: imageUrlProvider.lastSuccessfullyLoadedUrl)
        imageUrlProvider = updatedUrlProvider
        reloadRowsIfNeeded()
    }
    
    // MARK: - Private methods
    
    private func createSection() -> Section {
        let imageRowState = ImageRowStateProvider(imageLoaded: (image != nil),
                                                  isImageLoading: isImageLoading).state
        let buttonsStateProvider = ButtonsStateProvider(counterValue: counterStorage.count,
                                                        isImageLoading: isImageLoading,
                                                        isImageUrlEmpty: (imageUrlProvider.imageUrl == nil),
                                                        isImageUrlChanged: imageUrlProvider.isUrlChangedFromLastSuccessfullyLoad)
        
        let imageRow = ImageRow(state: imageRowState,
                                placeholder: UIImage.placeholder,
                                image: image)
        let inputRow = InputRow(urlString: imageUrlProvider.imageUrlString)
        let counterRow = CounterRow(count: counterStorage.count,
                                    counterDescription: String.Localized.labelCounter)
        let buttonsRow = ButtonsRow(loadButtonTitle: String.Localized.buttonLoad,
                                    cancelButtonTitle: String.Localized.buttonCancel,
                                    incrementButtonTitle: String.Localized.buttonIncrement,
                                    isLoadButtonEnabled: buttonsStateProvider.isLoadButtonEnabled,
                                    isCancelButtonEnabled: buttonsStateProvider.isCancelButtonEnabled,
                                    isIncrementButtonEnabled: buttonsStateProvider.isIncrementButtonEnabled)
        return Section(rows: [.image(row: imageRow),
                              .input(row: inputRow),
                              .counter(row: counterRow),
                              .buttons(row: buttonsRow)])
    }
    
    private func reloadRowsIfNeeded() {
        guard let delegate = self.delegate else {
            return
        }
        
        let updatedSection = createSection()
        var indexPaths = [IndexPath]()
        for i in 0..<updatedSection.rows.count {
            let currentRow = mainSection.rows[i]
            let updatedRow = updatedSection.rows[i]
            if currentRow == updatedRow {
                continue
            }
            indexPaths.append(IndexPath(row: i, section: 0))
        }
        
        if (!indexPaths.isEmpty) {
            mainSection = updatedSection
            delegate.reloadRows(at: indexPaths)
        }
    }
    
}

// MARK: - UITableViewDataSource protocol

extension DataControllerImpl: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainSection.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = mainSection.rows[indexPath.row]
        
        switch row {
        case .image(let imageRow):
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.reuseIdentifier,
                                                     for:indexPath) as! ImageCell
            cell.configure(isLoading: imageRow.isLoading,
                           image: imageRow.currentImage)
            return cell
            
        case .input(let inputRow):
            let cell = tableView.dequeueReusableCell(withIdentifier: InputCell.reuseIdentifier,
                                                     for:indexPath) as! InputCell
            cell.configure(text: inputRow.urlString,
                           placeholder: inputRow.placeholder)
            return cell
            
        case .counter(let counterRow):
            let cell = tableView.dequeueReusableCell(withIdentifier: CounterCell.reuseIdentifier,
                                                     for:indexPath) as! CounterCell
            cell.configure(description: counterRow.counterDescription,
                           count: String(counterRow.count))
            return cell
            
        case .buttons(let buttonsRow):
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonsCell.reuseIdentifier,
                                                     for:indexPath) as! ButtonsCell
            cell.configure(loadButtonTitle: buttonsRow.loadButtonTitle,
                           cancelButtonTitle: buttonsRow.cancelButtonTitle,
                           incrementButtonTitle: buttonsRow.incrementButtonTitle,
                           loadButtonEnabled: buttonsRow.isLoadButtonEnabled,
                           cancelButtonEnabled: buttonsRow.isCancelButtonEnabled,
                           incrementButtonEnabled: buttonsRow.isIncrementButtonEnabled)
            return cell
        }
    }
    
}
