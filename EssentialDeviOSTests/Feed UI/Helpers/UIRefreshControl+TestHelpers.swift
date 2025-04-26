//
//  UIRefreshControl+TestHelpers.swift
//  EssentialDeviOSTests
//
//  Created by Min-Yang Huang on 4/20/25.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
}
