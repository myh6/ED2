//
//  RemoteFeedLoader.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 2024/1/8.
//

import Foundation

public enum HTTPClientResult {
    case success((Data, HTTPURLResponse))
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}

public final class RemoteFeedLoader {
    private var url: URL
    private var client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity, invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { result in
            switch result {
            case .success:
                completion(.invalidData)
            case .failure:
                completion(.connectivity)
            }
        }
    }
}
