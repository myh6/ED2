//
//  EssentialDeviOSTests.swift
//  EssentialDeviOSTests
//
//  Created by Min-Yang Huang on 4/17/25.
//

import XCTest
@testable import EssentialDeviOS

class FeedViewController {
    init(loader: FeedViewControllerTests.LoaderSpy) {}
}

final class FeedViewControllerTests: XCTestCase {

    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
    
    class LoaderSpy {
        private(set) var loadCallCount = 0
    }
}
