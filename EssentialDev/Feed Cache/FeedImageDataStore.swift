//
//  FeedImageDataStore.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 4/29/25.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
