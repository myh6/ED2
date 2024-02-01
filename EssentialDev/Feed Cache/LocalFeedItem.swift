//
//  LocalFeedItem.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 2024/1/31.
//

import Foundation

public struct LocalFeedItem: Equatable {
    
    public init(id: UUID, description: String?, location: String?, imageURL: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.imageURL = imageURL
    }
    
    public let id: UUID
    public let description: String?
    public let location: String?
    public let imageURL: URL
}
