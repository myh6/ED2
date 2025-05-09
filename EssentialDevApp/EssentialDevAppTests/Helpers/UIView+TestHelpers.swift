//
//  UIView+TestHelpers.swift
//  EssentialDevAppTests
//
//  Created by Min-Yang Huang on 5/8/25.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
