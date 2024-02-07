//
//  ValidateFeedCacheUseCase.swift
//  EssentialDevTests
//
//  Created by Min-Yang Huang on 2024/2/6.
//

import XCTest
import EssentialDev

final class ValidateFeedCacheUseCase: XCTestCase {

    func test_init_doesNotMessageStoreUponCreation() {
        let (_ , store) = makeSUT()
        XCTAssertEqual(store.receiveMessages, [])
    }
    
    //MARK: - Helpers
    
    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #file, line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }

}
