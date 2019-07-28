//
//  StragerThingsHeaderView.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 28/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class StragerThingsHeaderView: UITableViewHeaderFooterView, ReusableHeaderFooter {
    
    typealias T = STSection

    @IBOutlet weak var lblTitle: UILabel!
    
    var item: STSection? {
        didSet {
            lblTitle.text = item?.headerProperty?.model?.title ?? ""
        }
    }
    
}
