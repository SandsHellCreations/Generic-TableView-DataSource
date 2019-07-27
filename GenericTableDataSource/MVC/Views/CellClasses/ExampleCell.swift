//
//  ExampleCell.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 15/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class ExampleCell: UITableViewCell, ReusableCell {
    
    typealias T = DefaultCellModel<ExampleModel>
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    
    var item: DefaultCellModel<ExampleModel>? {
        didSet {
            lblTitle.text = item?.property?.model?.title ?? ""
            lblSubTitle.text = item?.property?.model?.subTitle ?? ""
        }
    }

}
