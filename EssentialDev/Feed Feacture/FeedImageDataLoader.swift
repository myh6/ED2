//
//  FeedImageDataLoader.swift
//  EssentialDeviOS
//
//  Created by Min-Yang Huang on 4/20/25.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
