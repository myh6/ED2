//
//  FeedViewControllerTests+Localization.swift
//  EssentialDeviOSTests
//
//  Created by Min-Yang Huang on 4/25/25.
//

import Foundation
import XCTest
import EssentialDeviOS

extension FeedUIIntegrationTests {
    func localized(_ key: String, file: StaticString = #file, line: UInt = #line) -> String {
        let table = "Feed"
        let bundle = Bundle(for: FeedViewController.self)
        let value = NSLocalizedString(key, tableName: table, bundle: bundle, comment: "")
        
        if value == key {
            XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
        }
        
        return value
    }
}
