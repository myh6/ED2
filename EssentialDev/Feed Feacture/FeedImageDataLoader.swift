//
//  FeedImageDataLoader.swift
//  EssentialDeviOS
//
//  Created by Min-Yang Huang on 4/20/25.
//

import Foundation

public protocol FeedImageDataLoader {
    typealias Result = Swift.Result<Data, Error>
    
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataLoaderTask
}

public protocol FeedImageDataLoaderTask {
    func cancel()
}
