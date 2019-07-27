//
//  TableDataSource.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 13/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class TableDataSource<T : HeaderFooterModelProvider, U: CellModelProvider, Z>: NSObject, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
  
  
  typealias DidSelectedRow = (_ indexPath : IndexPath, _ item: U?) -> Void
  typealias ViewForHeaderFooterInSection = (_ section : Int, _ headerFooterItem: T, _ view: UIView) -> Void
  typealias ListCellConfigureBlock = (_ cell : UITableViewCell , _ item : U?, _ indexpath: IndexPath) -> Void
  typealias DirectionForScroll = (_ direction: ScrollDirection) -> Void
  typealias InfiniteScroll = () -> Void
  typealias Pulled = () -> Void

  private var tableView: UITableView?
  private var items = Array<T>()
  private var tableType: TableType<T, U, Z>?
  private var identifier: String?
  private var height: CGFloat?
  private var infiniteLoadingStatus: InfiniteScrollStatus = .FinishLoading
  private lazy var refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: UIControl.Event.valueChanged)
    refreshControl.tintColor = UIColor.black
    
    return refreshControl
  }()
  private var isReloadingFinished = false
  
  public var didSelectRow: DidSelectedRow?
  public var configureHeaderFooter: ViewForHeaderFooterInSection?
  public var configureCell: ListCellConfigureBlock?
  public var scrollDirection: DirectionForScroll?
  public var addInfiniteScrolling: InfiniteScroll?
  public var addPullToRefresh: Pulled?
  
  init(_ _type: TableType<T, U, Z>, _ _tableView: UITableView, _ withPullToRefresh: Bool? = false) {
    super.init()
    tableType = _type
    tableView = _tableView
    switch _type {
    case .SingleListing(let _items, let _identifier, let _height):
      identifier = _identifier
      height = _height
      items = DefaultHeaderFooterModel<Z>.getSingleListingItems(array: _items, identifer: _identifier, height: _height) as! [T]
    case .MultipleSection(let _items):
      items = _items
    }
    if withPullToRefresh ?? false {
      tableView?.addSubview(refreshControl)
    }
    tableView?.delegate = self
    tableView?.dataSource = self
    tableView?.reloadData(success: { [weak self] in
      self?.isReloadingFinished = true
    })
  }
  
  public func updateAndReload(for type: UpdateType<T, U, Z>, _ reloadType: ReloadType) {
    isReloadingFinished = false
    switch type {
    case .SingleListing(let _items):
      items = DefaultHeaderFooterModel<Z>.getSingleListingItems(array: _items, identifer: identifier ?? "", height: height ?? 0.0) as! [T]
    case .MultipleSection(let _items):
      items = _items
    }
    reloadTableView(type: reloadType)
  }
  
  public func stopInfiniteLoading(_ status: InfiniteScrollStatus) {
    infiniteLoadingStatus = status
    refreshControl.endRefreshing()
  }
  
  public func refreshProgrammatically() {
    infiniteLoadingStatus = .LoadingContent
    refreshControl.beginRefreshing()
    let offsetPoint = CGPoint.init(x: 0, y: -refreshControl.frame.size.height)
    tableView?.setContentOffset(offsetPoint, animated: true)
    addPullToRefresh?()
  }
  
  @objc private func handleRefresh(_ refreshControl: UIRefreshControl) {
    infiniteLoadingStatus = .LoadingContent
    addPullToRefresh?()
  }
 
  private func reloadTableView(type: ReloadType) {
    switch type {
    case .FullReload:
      tableView?.reloadData(success: { [weak self] in
        self?.isReloadingFinished = true
      })
    case .Reload(let indexPaths, let animation):
      tableView?.reloadRows(at: indexPaths, with: animation)
      isReloadingFinished = true
    case .ReloadSectionAt(let indexSet, let animation):
      tableView?.reloadSections(indexSet, with: animation)
      isReloadingFinished = true
    case .ReloadSectionTitles:
      tableView?.reloadSectionIndexTitles()
      isReloadingFinished = true
    case .None:
      isReloadingFinished = true
    case .DeleteRowsAt(let indexPaths, let animation):
      tableView?.beginUpdates()
      tableView?.deleteRows(at: indexPaths, with: animation)
      tableView?.endUpdates()
      tableView?.reloadData(success: { [weak self] in
        self?.isReloadingFinished = true
      })
    }
  }
  
  internal func numberOfSections(in tableView: UITableView) -> Int {
    return items.count
  }
  
  internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items[section].items?.count ?? 0
  }
  
  internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let item = items[section]
    guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: item.headerProperty?.identifier ?? "") else {
      return nil
    }
    configureHeaderFooter?(section, item, headerView)
    return headerView
  }
  
  internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = items[indexPath.section].items?[indexPath.row] as? U
    let cell = tableView.dequeueReusableCell(withIdentifier: item?.property?.identifier ?? "", for: indexPath)
    configureCell?(cell, item, indexPath)
    return cell
  }
  
  internal func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    let item = items[section]
    guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: item.footerProperty?.identifier ?? "") else {
      return nil
    }
    configureHeaderFooter?(section, item, footerView)
    return footerView
  }
  
  internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return items[section].headerProperty?.height ?? 0.0001
  }
  
  internal func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return items[section].footerProperty?.height ?? 0.0001
  }
  
  internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return items[indexPath.section].items?[indexPath.row].property?.height ?? UITableView.automaticDimension
  }
  
  internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = items[indexPath.section].items?[indexPath.row] as? U
    didSelectRow?(indexPath, item)
  }
  
  internal func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    switch velocity {
    case _ where velocity.y < 0:
      // swipes from top to bottom of screen -> down
      scrollDirection?(.Down)
    case _ where velocity.y > 0:
      // swipes from bottom to top of screen -> up
      scrollDirection?(.Up)
    default: break
    }
  }
  
  internal func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    if !isReloadingFinished {
      return
    }
    
    if refreshControl.isRefreshing {
      return
    }
    
    switch infiniteLoadingStatus {
    case .LoadingContent, .NoContentAnyMore:
      return
    case .FinishLoading:
      // calculates where the user is in the y-axis
      let offsetY = scrollView.contentOffset.y
      let contentHeight = scrollView.contentSize.height
      
      if offsetY > contentHeight - scrollView.frame.size.height {
        infiniteLoadingStatus = .LoadingContent
        addInfiniteScrolling?()
      }
    }
    
  }
  
}
