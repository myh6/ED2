//
//  RemoteFeedLoader.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 2024/1/8.
//

import Foundation

public final class RemoteFeedLoader: FeedLoader {
    private var url: URL
    private var client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity, invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping (FeedLoader.Result) -> Void) {
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case let .success((data, response)):
                completion(RemoteFeedLoader.map(data, from: response))
            case .failure:
                completion(.failure(Error.connectivity))
            }
        }
    }
    
    private static func map(_ data: Data, from response: HTTPURLResponse) -> FeedLoader.Result {
        do {
            let items = try FeedItemMapper.map(data, from: response)
            return .success(items)
        } catch {
            return .failure(error)
        }
    }
}
