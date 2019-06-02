//
//  TableViewDataSource.swift
//  ImageLoader
//
//  Created by Anton Grachev on 02/06/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import Foundation
import UIKit

final class TableViewDataSource: NSObject {
    
    // MARK: - Properties
    
    private let dataController: DataController
    
    // MARK: - Init
    
    init(dataController: DataController) {
        self.dataController = dataController
    }
    
}

// MARK: - UITableViewDataSource protocol

extension TableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataController.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = dataController.rowForIndexPath(indexPath)
        
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
