//
//  TableProtocols.swift
//  AE
//
//  Created by MAC_MINI_6 on 08/04/19.
//  Copyright © 2019 MAC_MINI_6. All rights reserved.
//

import UIKit



protocol HeaderFooterModelProvider {
    
    typealias HeaderProperty = (identifier: String?, height: CGFloat?, model: HeaderModelType?)
    typealias FooterProperty = (identifier: String?, height: CGFloat?, model: FooterModelType?)
    
    associatedtype CellModelType : CellModelProvider
    associatedtype HeaderModelType
    associatedtype FooterModelType
    
    var headerProperty: HeaderProperty? { get set }
    var footerProperty: FooterProperty? { get set }
    var items: [CellModelType]? { get set }
    
    init(_ _header: HeaderProperty?, _ _footer: FooterProperty?, _ _items: [CellModelType]?)
    
}

protocol CellModelProvider {
    
    typealias Property = (identifier: String, height: CGFloat, model: CellModelType?)
    
    associatedtype CellModelType
    
    var property: Property? { get set }
    
    init(_ _property: Property?)
}


class DefaultHeaderFooterModel<T>: HeaderFooterModelProvider {
    
    typealias HeaderModelType = Any
    
    typealias FooterModelType = Any
    
    typealias CellModelType = DefaultCellModel<T>
    
    var headerProperty: HeaderProperty?
    
    var footerProperty: FooterProperty?
    
    var items: [CellModelType]?
    

    required init(_ _header: HeaderProperty?, _ _footer: FooterProperty?, _ _items: [DefaultCellModel<T>]?) {
        headerProperty = _header
        footerProperty = _footer
        items = _items
    }
    
    class func getSingleListingItems(array: [T]?, identifer: String, height: CGFloat) -> [DefaultHeaderFooterModel<T>] {
     
        var protocolConformingArray = [CellModelType]()
        
        array?.forEach {
            protocolConformingArray.append(CellModelType.init((identifer, height, $0)))
        }
        
        let section1 = [DefaultHeaderFooterModel<T>.init(nil, nil, protocolConformingArray)]
        
        return section1
        
    }
}


class DefaultCellModel<T>: CellModelProvider {
    
    typealias CellModelType = T

    var property: (identifier: String, height: CGFloat, model: T?)?
    
    required init(_ _property: (identifier: String, height: CGFloat, model: T?)?) {
        property = _property
    }
    
}

