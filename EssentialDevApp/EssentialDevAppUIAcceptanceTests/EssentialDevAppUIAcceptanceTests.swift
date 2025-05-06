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
        
        let feedCells = app.cells.matching(identifier: "feed-image-cell")
        XCTAssertEqual(feedCells.count, 22)
        
        let firstImage = app.images.matching(identifier: "feed-image-view").firstMatch
        XCTAssertTrue(firstImage.exists)
    }
}
