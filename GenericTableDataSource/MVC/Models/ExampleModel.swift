//
//  ExampleModel.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 15/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import Foundation

class ExampleModel {
    var title: String?
    var subTitle: String?
    
    init(_ _title: String?, _ _subTitle: String?) {
        title = _title
        subTitle = _subTitle
    }
    
    class func getExampleTypes() -> [ExampleModel] {
        
        return [ExampleModel("Example 01", "SingleCell type items listing"),
                ExampleModel("Example 02", "SingleCell type items listing with paging"),
                ExampleModel("Example 03", "SingleCell type items listing with pullToRefresh"),
                ExampleModel("Example 04", "SingleCell type items listing with paging and pullToRefresh both"),
                ExampleModel("Example 05", "SingleCell type items in each section"),
                ExampleModel("Example 06", "Different cell type items in one section with multiple sections"),
                ExampleModel("Example 07", "Leading and trailing swipe actions")]
    }
    
}
