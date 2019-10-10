//
//  Example01VC.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 15/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class Example01VC: UIViewController {

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
        
        dataSource = TableDataSource<DefaultHeaderFooterModel<Example01Model>, DefaultCellModel<Example01Model>, Example01Model>.init(.SingleListing(items: Example01Model.getItems(), identifier: Example01Cell.identfier, height: height, leadingSwipe: nil, trailingSwipe: nil), tableView)
        
        dataSource?.configureCell = { (cell, item, indexPath) in
            (cell as? Example01Cell)?.item = item
        }
    }
}
