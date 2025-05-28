//
//  CoreDataFeedStoreTests.swift
//  EssentialDevTests
//
//  Created by Min-Yang Huang on 2024/2/29.
//

import XCTest
import EssentialDev

class CoreDataFeedStoreTests: XCTestCase, FeedStoreSpecs {
    func test_retrieve_deliversEmptyOnEmptyCache() throws {
        try makeSUT { sut in
            self.assertThatRetrieveDeliversEmptyOnEmptyCache(on: sut)
        }
    }
    
    func test_retrieve_hasNoSideEffectsOnEmptyCache() throws {
        try makeSUT { sut in
            self.assertThatRetrieveHasNoSideEffectsOnEmptyCache(on: sut)
        }
    }
    
    func test_retrieve_deliversFoundValueOnNonEmptyCache() throws {
        try makeSUT { sut in
            self.assertThatRetrieveDeliversFoundValuesOnNonEmptyCache(on: sut)
        }
    }
    
    func test_retrieve_hasNoSideEffectsOnNonEmptyCache() throws {
        try makeSUT { sut in
            self.assertThatRetrieveHasNoSideEffectsOnNonEmptyCache(on: sut)
        }
    }
    
    func test_insert_deliversNoErrorOnEmptyCache() throws {
        try makeSUT { sut in
            self.assertThatInsertDeliversNoErrorOnEmptyCache(on: sut)
        }
        
    }
    
    func test_insert_deliversNoErrorOnNonEmptyCache() throws {
        try makeSUT { sut in
            self.assertThatInsertDeliversNoErrorOnNonEmptyCache(on: sut)
        }
        
    }
    
    func test_insert_overridesPreviouslyInsertedCacheValues() throws {
        try makeSUT { sut in
            self.assertThatInsertOverridesPreviouslyInsertedCacheValues(on: sut)
        }
        
    }
    
    func test_delete_deliversNoErrorOnEmptyCache() throws {
        try makeSUT { sut in
            self.assertThatDeleteDeliversNoErrorOnEmptyCache(on: sut)
        }
    }
    
    func test_delete_hasNoSideEffectsOnEmptyCache() throws {
        try makeSUT { sut in
            self.assertThatDeleteHasNoSideEffectsOnEmptyCache(on: sut)
        }
    }
    
    func test_delete_deliversNoErrorOnNonEmptyCache() throws {
        try makeSUT { sut in
            self.assertThatDeleteDeliversNoErrorOnNonEmptyCache(on: sut)
        }
        
    }
    
    func test_delete_emptiesPreviouslyInsertedCache() throws {
        try makeSUT { sut in
            self.assertThatDeleteEmptiesPreviouslyInsertedCache(on: sut)
        }
    }
    
    //MARK: - Helpers
    private func makeSUT(_ test: @escaping (CoreDataFeedStore) -> Void, file: StaticString = #file, line: UInt = #line) throws {
        let storeURL = URL(fileURLWithPath: "/dev/null")
        let sut = try CoreDataFeedStore(storeURL: storeURL)
        trackForMemoryLeaks(sut)
        
        let exp = expectation(description: "Wait for operation")
        sut.perform {
            test(sut)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 0.1)
    }
    
}
