//
//  RemoteFeedLoaderTests.swift
//  EssentialDevTests
//
//  Created by Min-Yang Huang on 2024/1/8.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        
        XCTAssertNil(client.requestedURL)
    }
}
