//
//  EpisodeCell.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 28/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell, ReusableCell {
    
    @IBOutlet weak var lblEpisodeName: UILabel!
    @IBOutlet weak var lblDirectorName: UILabel!
    
    typealias T = STCell
    
    var item: STCell? {
        didSet {
            lblEpisodeName.text = item?.property?.model?.episode ?? ""
            lblDirectorName.text = item?.property?.model?.director ?? ""
        }
    }
    

    
}
