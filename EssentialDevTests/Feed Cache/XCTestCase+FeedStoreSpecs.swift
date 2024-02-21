//
//  XCTestCase+FeedStoreSpecs.swift
//  EssentialDevTests
//
//  Created by Min-Yang Huang on 2024/2/21.
//

import XCTest
import EssentialDev

extension FeedStoreSpecs where Self: XCTestCase {
    @discardableResult
    func insert(_ cache: (feed: [LocalFeedImage], timestamp: Date), to sut: FeedStore) -> Error? {
        let exp = expectation(description: "Wait for cache insertion")
        var insertionError: Error?
        sut.insert(cache.feed, timestamp: cache.timestamp) { receivedInsertionError in
            insertionError = receivedInsertionError
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
        return insertionError
    }
    
    @discardableResult
    func delete(from sut: FeedStore) -> Error? {
        let exp = expectation(description: "Wait for deletion")
        var capturedError: Error?
        sut.deleteCachedFeed { receivedError in
            capturedError = receivedError
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
        
        return capturedError
    }
    
    func expect(_ sut: FeedStore, toRetrieve expectedResult: RetrieveCachedFeedResult, file: StaticString = #file, line: UInt = #line) {
        let exp = expectation(description: "Wait for cache retrieval")
        
        sut.retrieve { retrievalResult in
            switch (expectedResult, retrievalResult) {
            case (.empty, .empty), (.failure, .failure):
                break
                
            case let (.found(expectedFeed, expectedTimestamp), .found(retrievedFeed,retrievedTimestamp)):
                XCTAssertEqual(expectedFeed, retrievedFeed)
                XCTAssertEqual(expectedTimestamp, retrievedTimestamp)
            
            default:
                XCTFail("Expecte to retrieve \(expectedResult), but got \(retrievalResult) instead", file: file, line: line)
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1.0)
    }
    
    func expect(_ sut: FeedStore, toRetrieveTwice expectedResult: RetrieveCachedFeedResult, file: StaticString = #file, line: UInt = #line) {
        expect(sut, toRetrieve: expectedResult, file: file, line: line)
        expect(sut, toRetrieve: expectedResult, file: file, line: line)
    }
}
