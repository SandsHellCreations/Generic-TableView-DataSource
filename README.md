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
        var leadingSwipeConfig: SKSwipeActionConfig? { get set }
        var trailingSwipeConfig: SKSwipeActionConfig? { get set }
    
        init(_ _property: Property?, _ _leadingSwipe: SKSwipeActionConfig?, _ _trailingSwipe: SKSwipeActionConfig?)
        
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
## Code Examples
1. For single listing with single cell types.
    Consider you have following model.
    ```
    class Example01Model {
        var name: String?
        var description: String?
        var imageName: String?
    
        init(_ _name: String?, _ _desc: String?, _ _imageName: String?) {
            name = _name
            description = _desc
            imageName = _imageName
        }
    }
    ```
    You can declare and instantiate tableViewDataSource instance like below.
    ``` 
    private var items = [Example01Model]()
    private var dataSource: TableDataSource<DefaultHeaderFooterModel<Example01Model>, //Model Type for header footer conforming HeaderFooterModelProvider protocol
                                              DefaultCellModel<Example01Model>, //Model Type for cell confirming CellModelProvider protocol
                                              Example01Model>? //Model Type of data to be used in cell
    dataSource = TableDataSource<DefaultHeaderFooterModel<Example01Model>, DefaultCellModel<Example01Model>, Example01Model>.init(.SingleListing(items: items, identifier: Example01Cell.identfier, height: height), tableView)

    ```
    Setting data inside cell
    ```
    class Example01Cell: UITableViewCell, ReusableCell { //Inheriting Reuasable Cell Protocol
    
        typealias T = DefaultCellModel<Example01Model> //Declaring type of model to be used
    
        @IBOutlet weak var imgView: UIImageView!
        @IBOutlet weak var lblTitle: UILabel!
        @IBOutlet weak var lblDesc: UILabel!
    
    
        var item: DefaultCellModel<Example01Model>? { // variable from which we can set data in cell
            didSet {
                imgView.layer.cornerRadius = 16.0
                imgView.layer.borderColor = UIColor.darkGray.cgColor
                imgView.layer.borderWidth = 0.8
                imgView.image = UIImage(named: item?.property?.model?.imageName ?? "")
                lblTitle.text = item?.property?.model?.name ?? ""
                lblDesc.text = item?.property?.model?.description ?? ""
            }
        }
    }
    ```
2. For multiple section and cell listing.
    We need two models one for section footer and one for cell following rules that we've discussessed above.
    ```
    class SeasonHeaderFooterModel: HeaderFooterModelProvider { //conforming HeaderFooterModelProvider protocol
    
        typealias CellModelType = ActorCellModel //cell model type
    
        typealias HeaderModelType = Season //header model type
    
        typealias FooterModelType = Any //Footer model type
    
        var headerProperty: (identifier: String?, height: CGFloat?, model: Season?)?
    
        var footerProperty: (identifier: String?, height: CGFloat?, model: Any?)?
    
        var items: [ActorCellModel]?
    
        required init(_ _header: (identifier: String?, height: CGFloat?, model: Season?)?, _ _footer: (identifier: String?, height: CGFloat?, model: Any?)?, _ _items: [ActorCellModel]?) {
            headerProperty = _header
            footerProperty = _footer
            items = _items
        }
    }
    
    class ActorCellModel: CellModelProvider { //confirming CellModelProvider protocol
    
        typealias CellModelType = Actor // model type of data to be used in cell
    
        var property: (identifier: String, height: CGFloat, model: Actor?)?
    
        required init(_ _property: (identifier: String, height: CGFloat, model: Actor?)?) {
            property = _property
        }
    }
    ```
    You can declare and instantiate tableViewDataSource instance like below.
    ```
    private var items = [SeasonHeaderFooterModel]()
    private var dataSource: TableDataSource<SeasonHeaderFooterModel, ActorCellModel, Actor>?
    dataSource = TableDataSource<SeasonHeaderFooterModel, ActorCellModel, Actor>.init(.MultipleSection(items: items), tableView)
    ```
    Setting data inside header footer view
    ```
    class TVSeriesHeaderView: UITableViewHeaderFooterView, ReusableHeaderFooter {
    
        typealias T = SeasonHeaderFooterModel // model type of data to be used in header footer view 
    
        @IBOutlet weak var lblTitle: UILabel!
    
        var item: SeasonHeaderFooterModel? {
            didSet {
                lblTitle.text = item?.headerProperty?.model?.title ?? ""
            }
        }
    }
    ```
3. Table View Data source blocks can be used for further functionality.
    ```
    dataSource?.configureHeaderFooter = { (section, item, view) in
        (view as? TVSeriesHeaderView)?.item = item
    }
    
    dataSource?.configureCell = { (cell, item, indexPath) in
        (cell as? Example01Cell)?.item = item
    }
    
    dataSource?.addPullToRefresh = { [weak self] in
        self?.pageNo = 0
        self?.getNewDataWhenPulled()
    }
    
    dataSource?.addInfiniteScrolling = { [weak self] in
        self?.pageNo = (self?.pageNo ?? 0) + 1
        self?.addMoreDataWithPaging()
    }
    
    dataSource?.scrollDirection = { (direction) in
        switch direction {
        case .Up:
            break
        case .Down:
            break
        }
    }
    
    dataSource?.didSelectRow = { (indexPath, item) in
        
    }
    ```
4. Leading and trailing swipe actions.
    ```
    protocol CellModelProvider {
    
    typealias Property = (identifier: String, height: CGFloat, model: CellModelType?)
    
    associatedtype CellModelType
    
    var property: Property? { get set }
    var leadingSwipeConfig: SKSwipeActionConfig? { get set } // used to assign leading actions
    var trailingSwipeConfig: SKSwipeActionConfig? { get set } // used to assign trailing actions
    
    init(_ _property: Property?, _ _leadingSwipe: SKSwipeActionConfig?, _ _trailingSwipe: SKSwipeActionConfig?)
    
    }
    
    // Internal class handling all actions in datasource
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
    ```
    block that can be used to handle leading and trailing actions.
    ```
    dataSource?.editActionForRow = { (indexPath, identifier, action) in
        switch action {
            case .Leading:
                print("Leading action tapped", "Identifer: \(identifier)")
                // do anything according to identifer if multiple actions
            case .Trailing:
                print("Trailing action tapped", "Identifer: \(identifier)")
                // do anything according to identifer if multiple actions
        }
    }
    ```

    
## Contact us for any queries and feature request
[![Twitter][1.1]][1]
[![Facebook][2.1]][2]
[![Github][3.1]][3]
[![Instagram][4.1]][4]
[![Medium][5.1]][5]

[1.1]: https://raw.githubusercontent.com/SandeepSpider811/Generic-TableView-DataSource/master/GenericTableDataSource/Assets.xcassets/social_twiiter.imageset/social_twiiter.png (twitter icon with padding)
[2.1]: https://raw.githubusercontent.com/SandeepSpider811/Generic-TableView-DataSource/master/GenericTableDataSource/Assets.xcassets/social_facebook.imageset/social_facebook.png (facebook icon with padding)
[3.1]: https://raw.githubusercontent.com/SandeepSpider811/Generic-TableView-DataSource/master/GenericTableDataSource/Assets.xcassets/social_github.imageset/social_github.png (github plus icon with padding)
[4.1]: https://raw.githubusercontent.com/SandeepSpider811/Generic-TableView-DataSource/master/GenericTableDataSource/Assets.xcassets/social_instagram.imageset/social_instagram.png (Instagram icon with padding)
[5.1]: https://raw.githubusercontent.com/SandeepSpider811/Generic-TableView-DataSource/master/GenericTableDataSource/Assets.xcassets/social_medium.imageset/social_medium.png (Medium icon with padding)

[1]: https://twitter.com/SandsHell811
[2]: https://www.facebook.com/Sandeep.kumar811
[3]: https://github.com/SandeepSpider811
[4]: https://www.instagram.com/sandshellcreations/
[5]: https://medium.com/@sandshell811

