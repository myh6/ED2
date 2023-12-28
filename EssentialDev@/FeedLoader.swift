//
//  FeedLoader.swift
//  EssentialDev@
//
//  Created by Min-Yang Huang on 2023/12/28.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
