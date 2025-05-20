//
//  UIRefreshControl+Helpers.swift
//  EssentialDeviOS
//
//  Created by Min-Yang Huang on 4/27/25.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
