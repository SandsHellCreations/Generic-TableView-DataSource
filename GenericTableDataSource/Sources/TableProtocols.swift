//
//  TableProtocols.swift
//  AE
//
//  Created by MAC_MINI_6 on 08/04/19.
//  Copyright © 2019 MAC_MINI_6. All rights reserved.
//

import UIKit



protocol HeaderFooterModelProvider {
    
    associatedtype UITableViewCellModelType : CellModelProvider
    associatedtype UITableHeaderFooterViewModelType
    
    var property: (identifier: String, height: CGFloat, type: HeaderFooter)? { get set }
    var items: [UITableViewCellModelType]? { get set }
    var model: UITableHeaderFooterViewModelType? { get set }
    
    
    init(_ _property: (identifier: String, height: CGFloat, type: HeaderFooter)?, _ _items: [UITableViewCellModelType]?, _ _model: UITableHeaderFooterViewModelType?)
}

protocol CellModelProvider {
    
    associatedtype UITableViewCellModelType
    
    var property: (identifier: String, height: CGFloat)? { get set }
    var model: UITableViewCellModelType? { get set }
    
    init(_ _property: (identifier: String, height: CGFloat)?, _ _model: UITableViewCellModelType?)
}


class DefaultHeaderFooterModel<T>: HeaderFooterModelProvider {

    var property: (identifier: String, height: CGFloat, type: HeaderFooter)?
    
    var items: [UITableViewCellModelType]?
    
    var model: Any?
    
    typealias UITableViewCellModelType = DefaultCellModel<T>
    typealias UITableHeaderFooterViewModelType = Any

    required init(_ _property: (identifier: String, height: CGFloat, type: HeaderFooter)?, _ _items: [UITableViewCellModelType]?, _ _model: UITableHeaderFooterViewModelType?) {
        property = _property
        items = _items
        model = _model
    }
    
    class func getSingleListingItems(array: [T]?, identifer: String, height: CGFloat) -> [DefaultHeaderFooterModel<T>] {
     
        var protocolConformingArray = [UITableViewCellModelType]()
        
        array?.forEach {
            protocolConformingArray.append(UITableViewCellModelType.init((identifer, height), $0))
        }
        
        let section1 = [DefaultHeaderFooterModel<T>.init(("", 0.0001, .Header), protocolConformingArray, nil)]
        
        return section1
        
    }
}


class DefaultCellModel<T>: CellModelProvider {
    
    var property: (identifier: String, height: CGFloat)?
    
    var model: UITableViewCellModelType?
    
    typealias UITableViewCellModelType = T
    
    required init(_ _property: (identifier: String, height: CGFloat)?, _ _model: UITableViewCellModelType?) {
        property = _property
        model = _model
    }
    
}

