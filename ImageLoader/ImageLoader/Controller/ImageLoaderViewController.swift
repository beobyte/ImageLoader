//
//  ImageLoaderViewController.swift
//  ImageLoader
//
//  Created by Anton Grachev on 18/05/2019.
//  Copyright © 2019 Anton Grachev. All rights reserved.
//

import UIKit

public final class ImageLoaderViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let dataContoller: DataController = DataControllerImpl(counterStorage: CounterStorageImpl(),
                                                                   imageLoader: ImageLoaderImpl(),
                                                                   imageUrlProvider: ImageUrlProvider.default())
    private lazy var dataSource = TableViewDataSource(dataController: dataContoller)
    
    // MARK: - Overrides
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        dataContoller.delegate = self
        
        tableView.dataSource = dataSource
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.reloadData()
    }
    
    // MARK: - @IBActions
    
    @IBAction func loadButtonPressed(_ sender: UIButton) {
        dataContoller.loadImage()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dataContoller.cancelImageLoading()
    }
    
    @IBAction func incrementButtonPressed(_ sender: UIButton) {
        dataContoller.incrementCounter()
    }
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        dataContoller.updateImageUrl(with: sender.text)
    }
    
}

// MARK: - DataControllerDelegate protocol

extension ImageLoaderViewController: DataControllerDelegate {
    
    func reloadRows(at indexPaths: [IndexPath]) {
        tableView.reloadRows(at: indexPaths, with: .none)
    }
    
    func presentAlertController(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: String.Localized.buttonOk,
                                     style: .cancel,
                                     handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}


