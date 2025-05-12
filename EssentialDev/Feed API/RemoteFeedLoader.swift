//
//  RemoteFeedLoader.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 2024/1/8.
//

import Foundation

public typealias RemoteFeedLoader = RemoteLoader<[FeedImage]>

public extension RemoteFeedLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: FeedItemMapper.map)
    }
}
