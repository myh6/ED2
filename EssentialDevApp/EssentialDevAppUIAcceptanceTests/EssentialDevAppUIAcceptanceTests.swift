//
//  EssentialDevAppUIAcceptanceTests.swift
//  EssentialDevAppUIAcceptanceTests
//
//  Created by Min-Yang Huang on 5/5/25.
//

import XCTest

final class EssentialDevAppUIAcceptanceTests: XCTestCase {

    func test_onLaunch_displaysRemoteFeedWhenCustomerHasConnectivity() {
        let app = XCUIApplication()

        app.launch()

        XCTAssertEqual(app.cells.count, 22)
//        XCTAssertEqual(app.cells.firstMatch.images.count, 1)
    }
}
