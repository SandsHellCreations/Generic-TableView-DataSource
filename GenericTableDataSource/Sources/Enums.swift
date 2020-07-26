//
//  TableType.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 13/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

enum TableType<T : HeaderFooterModelProvider, U : CellModelProvider, SingleListingModelType> {
    case SingleListing(items: [SingleListingModelType], identifier: String, height: CGFloat, leadingSwipe: SKSwipeActionConfig?, trailingSwipe: SKSwipeActionConfig?)
    case MultipleSection(items: [T])
}

enum UpdateType<T: HeaderFooterModelProvider, U : CellModelProvider, SingleListingModelType> {
    case SingleListing(items: [SingleListingModelType])
    case MultipleSection(items: [T])
}

enum InfiniteScrollStatus {
    case FinishLoading // stop infinite loading and pull to refresh
    case LoadingContent // handled automatically no need to setup assign Viewcontroller
    case NoContentAnyMore // no more paging
}

enum ReloadType {
    case FullReload
    case ReloadSectionAt(indexSet: IndexSet, animation: UITableView.RowAnimation)
    case Reload(indexPaths: [IndexPath], animation: UITableView.RowAnimation)
    case ReloadSectionTitles
    case None
    case DeleteRowsAt(indexPaths: [IndexPath], animation: UITableView.RowAnimation)
    case AddRowsAt(indexPaths: [IndexPath], animation: UITableView.RowAnimation, moveToLastIndex: Bool)
    case InsertSection(indexSet: IndexSet, animation: UITableView.RowAnimation)
    case DeleteSection(indexSet: IndexSet, animation: UITableView.RowAnimation)
}

enum ScrollDirection {
    case Up
    case Down
}

enum EditAction {
    case Leading
    case Trailing
}
