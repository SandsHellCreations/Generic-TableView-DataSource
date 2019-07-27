//
//  Example05VC.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 27/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class Example05VC: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.registerXIBForHeaderFooter(TVSeriesHeaderView.identfier)
        }
    }
    
    private var dataSource: TableDataSource<SeasonHeaderFooterModel, ActorCellModel, Actor>?
    private var items = [SeasonHeaderFooterModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = SeasonHeaderFooterModel.getSectionalData()
        configureTableView()
    }

    private func configureTableView() {
        dataSource = TableDataSource<SeasonHeaderFooterModel, ActorCellModel, Actor>.init(.MultipleSection(items: items), tableView)
        
        dataSource?.configureHeaderFooter = { (section, item, view) in
            (view as? TVSeriesHeaderView)?.item = item
        }
        
        dataSource?.configureCell = { (cell, item, indexPath) in
            (cell as? ActorCell)?.item = item
        }
    }
}
