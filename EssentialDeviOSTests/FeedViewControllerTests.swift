//
//  EssentialDeviOSTests.swift
//  EssentialDeviOSTests
//
//  Created by Min-Yang Huang on 4/18/25.
//

import XCTest
import EssentialDev
@testable import EssentialDeviOS

final class FeedViewController {
    init(loader: FeedViewControllerTests.LoaderSpy) {}
}

final class FeedViewControllerTests: XCTestCase {
    
    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
    
    //MARK: - Helpers
    class LoaderSpy {
        private(set) var loadCallCount = 0
    }

}
