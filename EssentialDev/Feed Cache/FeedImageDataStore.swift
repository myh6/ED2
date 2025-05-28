//
//  FeedImageDataStore.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 4/29/25.
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
