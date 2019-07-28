//
//  CharacterCell.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 28/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell, ReusableCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    typealias T = STCell
    
    var item: STCell? {
        didSet {
            let actor = item?.property?.model?.character
            lblTitle.text = actor?.name ?? ""
            imgView.image = actor?.image
        }
    }
    
    
}
