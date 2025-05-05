//
//  FeedCache.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 5/4/25.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
