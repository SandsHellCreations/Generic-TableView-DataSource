<p align="center">
<img src="https://github.com//SandeepSpider811/Generic-TableView-DataSource/blob/master/GenericTableDataSource/Assets.xcassets/Poster.imageset/Poster.png?raw=true" alt="Poster.png" />
</p>

## Features

* Single data source can be used to design simple to complex every type of vertical listing using tableview.
* Protocol oriented datasource with Generic models and associated types.
* Native pull to refresh functionality handled in datasource with UIRefreshControl.
* Infinite scrolling of tableview is also handled for paging.

## Rules to follow if you've set your mind to use it.

1. Every UITableView class should conform to **ReusableCell** protocol by inheriting it.
2. Every UITableViewHeaderFooterView class should confirm to **ReusableHeaderFooterView** protocol by inheriting it.
3. Your model class for setting data in UITableViewCell should confirm to **CellModelProvider** protocol by inherinting it.
    #### CellModelProvider
    ```
    protocol CellModelProvider {

        typealias Property = (identifier: String, height: CGFloat, model: CellModelType?)

        associatedtype CellModelType

        var property: Property? { get set }

        init(_ _property: Property?)
    }
    ```
4. Your model class for setting data in UITableViewHeaderFooterView should confirm to **HeaderFooterModelProvider** protocol by inheriting it.
    #### HeaderFooterModelProvider
    ```
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
    ```
