//
//  Eaxmple05Model.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 27/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class Season {
    var title: String?
    
    init(_title: String?) {
        title = _title
    }
}

class Actor {
    var image: UIImage?
    var name: String?
    
    init(_image: UIImage?, _name: String?) {
        image = _image
        name = _name
    }
}

class SeasonHeaderFooterModel: HeaderFooterModelProvider {
    
    typealias CellModelType = ActorCellModel
    
    typealias HeaderModelType = Season
    
    typealias FooterModelType = Any
    
    var headerProperty: (identifier: String?, height: CGFloat?, model: Season?)?
    
    var footerProperty: (identifier: String?, height: CGFloat?, model: Any?)?
    
    var items: [ActorCellModel]?
    
    required init(_ _header: (identifier: String?, height: CGFloat?, model: Season?)?, _ _footer: (identifier: String?, height: CGFloat?, model: Any?)?, _ _items: [ActorCellModel]?) {
        headerProperty = _header
        footerProperty = _footer
        items = _items
    }
}

extension SeasonHeaderFooterModel {
    class func getSectionalData() -> [SeasonHeaderFooterModel] {
        let height = UIScreen.main.bounds.width * 0.5
        
        let data = [SeasonHeaderFooterModel((TVSeriesHeaderView.identfier, 48, Season(_title: "Stranger Things")),
                                           nil,
                                           [ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "stranger_things_eleven"), _name: "Eleven")) ),
                                            ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "stranger_things_cheif_hopper"), _name: "Chief Hopper")) ),
                                            ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "stranger_things_steve"), _name: "Steve Harrington")) ),
                                            ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "stranger_things_dustin"), _name: "Dustin")) ),
                                            ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "stranger_things_jonathan"), _name: "Jonathan")) ),
                                            ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "stranger_things_will"), _name: "Will")) ),
                                            ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "stranger_things_lucas"), _name: "Mike")) ),
                                            ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "stranger_things_nancy"), _name: "Nancy")) ),
                                            ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "stranger_things_billy"), _name: "Billy")) ),
                                            ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "stranger_things_max"), _name: "Max")) )]),
                    SeasonHeaderFooterModel((TVSeriesHeaderView.identfier, 48, Season(_title: "13 Reasons why?")),
                                            nil,
                                            [ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "13ReasonsWhy_hannah"), _name: "Hannah Baker")) ),
                                             ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "13ReasonsWhy_clay_jensen"), _name: "Clay Jensen")) ),
                                             ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "13ReasonsWhy_jessica"), _name: "Jessica")) ),
                                             ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "13ReasonsWhy_tony"), _name: "Tony")) ),
                                             ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "13ReasonsWhy_bryce"), _name: "Bryce")) ),
                                             ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "13ReasonsWhy_zach"), _name: "Zach")) ),
                                             ActorCellModel((ActorCell.identfier, height, Actor.init(_image: #imageLiteral(resourceName: "13ReasonsWhy_sherry"), _name: "Sherry Holland")) )])
                    ]
        
        

        return data
    }
}

class ActorCellModel: CellModelProvider {
    
    typealias CellModelType = Actor

    var property: (identifier: String, height: CGFloat, model: Actor?)?
    
    required init(_ _property: (identifier: String, height: CGFloat, model: Actor?)?) {
        property = _property
    }
}
