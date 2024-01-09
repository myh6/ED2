//
//  FeedItem.swift
//  EssentialDev@
//
//  Created by Min-Yang Huang on 2023/12/28.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
