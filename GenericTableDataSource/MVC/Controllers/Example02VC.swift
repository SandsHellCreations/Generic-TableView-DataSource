//
//  Example02VC.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 16/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class Example02VC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: TableDataSource<DefaultHeaderFooterModel<Example01Model>,
                                            DefaultCellModel<Example01Model>,
                                            Example01Model>?
    
    private var items = [Example01Model]()
    private var pageNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = Example01Model.getItems()
        configureTableView()
    }
    
    private func configureTableView() {
        
        let height = UIScreen.main.bounds.width * 0.4
        
        dataSource = TableDataSource<DefaultHeaderFooterModel<Example01Model>, DefaultCellModel<Example01Model>, Example01Model>.init(.SingleListing(items: items, identifier: Example01Cell.identfier, height: height, leadingSwipe: nil, trailingSwipe: nil), tableView)
        
        dataSource?.configureCell = { (cell, item, indexPath) in
            (cell as? Example01Cell)?.item = item
        }
        
        dataSource?.addInfiniteScrolling = { [weak self] in
            self?.pageNo = (self?.pageNo ?? 0) + 1
            self?.addMoreDataWithPaging()
        }
    }
    
    private func addMoreDataWithPaging() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.items = (self?.items ?? []) + Example01Model.getItems()
            self?.dataSource?.updateAndReload(for: .SingleListing(items: self?.items ?? []), .FullReload)
            // When page no reaches 5 paging will not work any more just for example, use it your own way
            self?.dataSource?.stopInfiniteLoading((self?.pageNo ?? 0) == 5 ? .NoContentAnyMore : .FinishLoading)
        }
    }
}
