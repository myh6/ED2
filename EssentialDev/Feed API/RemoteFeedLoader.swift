//
//  RemoteFeedLoader.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 2024/1/8.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (Error) -> Void)
}

public final class RemoteFeedLoader {
    private var url: URL
    private var client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
    }
    
    public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping (Error) -> Void = { _ in }) {
        client.get(from: url) { error in
            completion(.connectivity)
        }
    }
}