//
//  Example06VC.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 28/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class Example06VC: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.registerXIBForHeaderFooter(StragerThingsHeaderView.identfier)
        }
    }
    
    private var dataSource: TableDataSource<STSection, STCell, StrangerThingCellData>?
    private var items = [STSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = STSection.getSectionalData()
        configureTableView()
    }

    private func configureTableView() {
        dataSource = TableDataSource<STSection, STCell, StrangerThingCellData>(.MultipleSection(items: items), tableView)
        
        dataSource?.configureCell = { (cell, item, indexPath) in
            switch item?.property?.identifier ?? "" {
            case DescriptionCell.identfier:
                (cell as? DescriptionCell)?.item = item
            case CharacterCell.identfier:
                (cell as? CharacterCell)?.item = item
            case EpisodeCell.identfier:
                (cell as? EpisodeCell)?.item = item
            default:
                break
            }
        }
        
        dataSource?.configureHeaderFooter = { (section, item, view) in
            (view as? StragerThingsHeaderView)?.item = item
        }
    }
}
