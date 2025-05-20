//
//  UITableView+Dequeueing.swift
//  EssentialDeviOS
//
//  Created by Min-Yang Huang on 4/24/25.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identificer = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identificer) as! T
    }
}
