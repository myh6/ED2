//
//  UIControl+TestHelpers.swift
//  EssentialDeviOSTests
//
//  Created by Min-Yang Huang on 4/20/25.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
