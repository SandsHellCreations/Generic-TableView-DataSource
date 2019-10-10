//
//  SKSwipeActionConfig.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 03/10/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit


class SKSwipeActionConfig {
    
    private var actionValues: [(title: String?, image: UIImage?, backGroundColor: UIColor, identifier: String)]?
    private var swipeActionConfig: UISwipeActionsConfiguration?
    public var didSelectAction: ((_ identifer: String) -> Void)?
    
    init(_ _actions: [(title: String?, image: UIImage?, backGroundColor: UIColor, identifier: String)]) {
        actionValues = _actions
        var skActions = [UIContextualAction]()
        
        actionValues?.forEach({ (item) in
            let action = UIContextualAction(style: .normal, title: item.title, handler: { [weak self] (action, view, handler) in
                handler(true)
                self?.didSelectAction?(item.identifier)
            })
            action.backgroundColor = item.backGroundColor
            action.image = item.image
            skActions.append(action)
        })
        
        swipeActionConfig = UISwipeActionsConfiguration(actions: skActions)
        swipeActionConfig?.performsFirstActionWithFullSwipe = true
    }
    
    func getConfig() -> UISwipeActionsConfiguration? {
        return swipeActionConfig
    }
}
