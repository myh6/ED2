//
//  FeedLoader.swift
//  EssentialDev@
//
//  Created by Min-Yang Huang on 2023/12/28.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
