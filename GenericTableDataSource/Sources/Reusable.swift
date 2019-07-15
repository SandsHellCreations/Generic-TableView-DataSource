//
//  Reusable.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 13/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import Foundation

protocol ReusableCell {
    
    associatedtype T : CellModelProvider
    
    static var identfier: String { get }
    var item: T? { get set }
}

extension ReusableCell {
    static var identfier: String {
        return String.init(describing: self)
    }
}

protocol ReusableHeaderFooter {
    associatedtype T : HeaderFooterModelProvider
    static var identfier: String { get }
    var item: T? { get set }
}

extension ReusableHeaderFooter {
    static var identfier: String {
        return String.init(describing: self)
    }
}
