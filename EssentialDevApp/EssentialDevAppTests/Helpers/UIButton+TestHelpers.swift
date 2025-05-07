//
//  UIButton+TestHelpers.swift
//  EssentialDeviOSTests
//
//  Created by Min-Yang Huang on 4/20/25.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
