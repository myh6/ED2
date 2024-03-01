//
//  RemoteFeedItem.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 2024/1/31.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
