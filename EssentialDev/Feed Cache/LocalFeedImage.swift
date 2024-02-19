//
//  LocalFeedItem.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 2024/1/31.
//

import Foundation

public struct LocalFeedImage: Equatable, Codable {
    
    public init(id: UUID, description: String?, location: String?, url: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.url = url
    }
    
    public let id: UUID
    public let description: String?
    public let location: String?
    public let url: URL
}
