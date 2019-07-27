//
//  UITableViewExtensions.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 13/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit


extension UITableView {
    func reloadData(success: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            success?()
        }
        reloadData()
        CATransaction.commit()
    }
    
    func registerXIB(_ nibName: String) {
        register(UINib.init(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func registerXIBForHeaderFooter(_ nibName: String) {
        register(UINib.init(nibName: nibName, bundle: nil), forHeaderFooterViewReuseIdentifier: nibName)
    }
}
