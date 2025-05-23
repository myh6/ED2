//
//  FeedStoreSpy.swift
//  EssentialDevTests
//
//  Created by Min-Yang Huang on 2024/2/4.
//

import Foundation
import EssentialDev

class FeedStoreSpy: FeedStore {
    private(set) var receiveMessages = [ReceiveMessage]()
    
    enum ReceiveMessage: Equatable {
        case deleteCachedFeed
        case insert([LocalFeedImage], Date)
        case retrieve
    }
    
    private var deletionCompletion = [DeletionCompletion]()
    private var insertionCompletion = [InsertionCompletion]()
    private var retrievalCompletion = [RetrievalCompletion]()
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        deletionCompletion.append(completion)
        receiveMessages.append(.deleteCachedFeed)
    }
    
    func completeDeletion(with error: Error, at index: Int = 0) {
        deletionCompletion[index](.failure(error))
    }
    
    func completeInsertion(with error: Error, at index: Int = 0) {
        insertionCompletion[index](.failure(error))
    }
    
    func completeDeletionSuccessfully(at index: Int = 0) {
        deletionCompletion[index](.success(()))
    }
    
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        receiveMessages.append(.insert(feed, timestamp))
        insertionCompletion.append(completion)
    }
    
    func completeInsertionSuccessfully(at index: Int = 0) {
        insertionCompletion[index](.success(()))
    }
    
    func retrieve(completion: @escaping RetrievalCompletion) {
        receiveMessages.append(.retrieve)
        retrievalCompletion.append(completion)
    }
    
    func completeRetrieval(with error: Error, at index: Int = 0) {
        retrievalCompletion[index](.failure(error))
    }
    
    func completeRetrievalWithEmptyCache(at index: Int = 0) {
        retrievalCompletion[index](.success(.none))
    }
    
    func completeRetrieval(with feed: [LocalFeedImage], timestamp: Date, at index: Int = 0) {
        retrievalCompletion[index](.success(CachedFeed(feed: feed, timestamp: timestamp)))
    }
}
