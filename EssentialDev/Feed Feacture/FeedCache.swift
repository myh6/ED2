//
//  FeedCache.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 5/4/25.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
