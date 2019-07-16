//
//  Example01Cell.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 16/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class Example01Cell: UITableViewCell, ReusableCell {
    
    typealias T = DefaultCellModel<Example01Model>
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    
    var item: DefaultCellModel<Example01Model>? {
        didSet {
            imgView.layer.cornerRadius = 16.0
            imgView.layer.borderColor = UIColor.darkGray.cgColor
            imgView.layer.borderWidth = 0.8
            imgView.image = UIImage(named: item?.model?.imageName ?? "")
            lblTitle.text = item?.model?.name ?? ""
            lblDesc.text = item?.model?.description ?? ""
        }
    }
}
