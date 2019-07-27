//
//  ActorCell.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 27/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class ActorCell: UITableViewCell, ReusableCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    typealias T = ActorCellModel
    
    var item: ActorCellModel? {
        didSet {
            lblName.text = item?.property?.model?.name ?? ""
            imgView.image = item?.property?.model?.image
        }
    }

}
