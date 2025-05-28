//
//  FeedImageDataCache.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 5/4/25.
//

import Foundation

public protocol FeedImageDataCache {
    func save(_ data: Data, for url: URL) throws
}
