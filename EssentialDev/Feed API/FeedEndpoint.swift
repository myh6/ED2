//
//  FeedEndpoint.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 5/24/25.
//

import Foundation

public enum FeedEndpoint {
    case get
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            baseURL.appending(path: "/v1/feed")
        }
    }
}
