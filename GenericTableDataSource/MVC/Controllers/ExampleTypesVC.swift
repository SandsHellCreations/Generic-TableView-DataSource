//
//  ViewController.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 07/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

//MARK:- Can be considered as single cell type items listing
class ExampleTypesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: TableDataSource<DefaultHeaderFooterModel<ExampleModel>, DefaultCellModel<ExampleModel>, ExampleModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    private func configureTableView() {
        dataSource = TableDataSource<DefaultHeaderFooterModel<ExampleModel>, DefaultCellModel<ExampleModel>, ExampleModel>.init(.SingleListing(items: ExampleModel.getExampleTypes(), identifier: ExampleCell.identfier, height: UITableView.automaticDimension), tableView)
        
        dataSource?.configureCell = { (cell, item, indexPath) in
            (cell as? ExampleCell)?.item = item
        }
        
        dataSource?.didSelectRow = { (indexPath, item) in
            print(item?.model?.subTitle ?? "")
        }
    }

}

