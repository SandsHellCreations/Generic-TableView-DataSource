//
//  TVSeriesHeaderView.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 27/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class TVSeriesHeaderView: UITableViewHeaderFooterView, ReusableHeaderFooter {
    
    typealias T = SeasonHeaderFooterModel
    
    @IBOutlet weak var lblTitle: UILabel!
    
    var item: SeasonHeaderFooterModel? {
        didSet {
            lblTitle.text = item?.headerProperty?.model?.title ?? ""
        }
    }


}
