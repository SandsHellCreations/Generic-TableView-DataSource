//
//  Example03VC.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 27/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class Example03VC: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var dataSource: TableDataSource<DefaultHeaderFooterModel<Example01Model>,
                                            DefaultCellModel<Example01Model>,
                                            Example01Model>?
    
    private var items = [Example01Model]()

    override func viewDidLoad() {
        super.viewDidLoad()
        items = Example01Model.getItems()
        configureTableView()
    }

    private func configureTableView() {
        
        let height = UIScreen.main.bounds.width * 0.4
        
        dataSource = TableDataSource<DefaultHeaderFooterModel<Example01Model>, DefaultCellModel<Example01Model>, Example01Model>.init(.SingleListing(items: items, identifier: Example01Cell.identfier, height: height, leadingSwipe: nil, trailingSwipe: nil), tableView, true)
        
        dataSource?.configureCell = { (cell, item, indexPath) in
            (cell as? Example01Cell)?.item = item
        }
        
        dataSource?.addPullToRefresh = { [weak self] in
            self?.getNewDataWhenPulled()
        }
    }
    
    private func getNewDataWhenPulled() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.items = Example01Model.getItems()
            self?.dataSource?.stopInfiniteLoading(.FinishLoading)
            self?.dataSource?.updateAndReload(for: .SingleListing(items: self?.items ?? []), .FullReload)
        }
    }
    
}
