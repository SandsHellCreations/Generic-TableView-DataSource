//
//  DescriptionCell.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 28/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class DescriptionCell: UITableViewCell, ReusableCell {
    
    typealias T = STCell

    @IBOutlet weak var lblDesc: UILabel!

    var item: STCell? {
        didSet {
            lblDesc.text = item?.property?.model?.desc ?? ""
        }
    }
}
