//
//  NullStore.swift
//  EssentialDevApp
//
//  Created by Min-Yang Huang on 5/26/25.
//

import Foundation
import EssentialDev

class NullStore: FeedStore {
    func deleteCachedFeed() throws {}
    
    func insert(_ feed: [EssentialDev.LocalFeedImage], timestamp: Date) {}
    
    func retrieve() throws -> CachedFeed? { .none }
}

extension NullStore: FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws {}
    
    func retrieve(dataForURL url: URL) throws -> Data? { .none }
}
