//
//  ImageCommentsEndpoint.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 5/24/25.
//

import Foundation

public enum ImageCommentsEndpoint {
    case get(UUID)
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(id):
            return baseURL.appending(path: "/v1/image/\(id)/comments")
        }
    }
}
