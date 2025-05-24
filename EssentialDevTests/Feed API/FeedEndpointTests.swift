//
//  FeedEndpointTests.swift
//  EssentialDevTests
//
//  Created by Min-Yang Huang on 5/24/25.
//

import XCTest
import EssentialDev

final class FeedEndpointTests: XCTestCase {

    func test_feed_endpointURL() {
        let baseURL = URL(string: "http://base-url.com")!
        
        let received = FeedEndpoint.get.url(baseURL: baseURL)
        let expected = URL(string: "http://base-url.com/v1/feed")!
        
        XCTAssertEqual(received, expected)
    }

}
