//
//  Example07VC.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 04/10/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class Example07VC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: TableDataSource<DefaultHeaderFooterModel<Example01Model>,
    DefaultCellModel<Example01Model>,
    Example01Model>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()

    }

    private func configureTableView() {
        let height = UIScreen.main.bounds.width * 0.4
        
        let leadingSwipe = SKSwipeActionConfig.init([("Add", nil, UIColor.blue, "ADD_ID"),
                                                    ("Edit", nil, UIColor.magenta, "EDIT_ID"),
                                                    (nil, UIImage(named: "ic_like"), UIColor.green, "LIKE_ID"),
                                                    ("Like", UIImage(named: "ic_like"), UIColor.orange, "LIKE_WITH_IMAGE_ID")])
        let trailingSwipe = SKSwipeActionConfig.init([("Delete", nil, UIColor.red, "DELETE_ID")])
        
        dataSource = TableDataSource<DefaultHeaderFooterModel<Example01Model>, DefaultCellModel<Example01Model>, Example01Model>.init(.SingleListing(items: Example01Model.getItems(), identifier: Example01Cell.identfier, height: height, leadingSwipe: leadingSwipe, trailingSwipe: trailingSwipe), tableView)
        
        dataSource?.configureCell = { (cell, item, indexPath) in
            (cell as? Example01Cell)?.item = item
        }
        
        dataSource?.editActionForRow = { (indexPath, identifier, action) in
            switch action {
            case .Leading:
                print("Leading action tapped", "Identifer: \(identifier)")
                // do anything according to identifer if multiple actions
            case .Trailing:
                print("Trailing action tapped", "Identifer: \(identifier)")
                // do anything according to identifer if multiple actions
            }
        }
    }
}
