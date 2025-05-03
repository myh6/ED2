//
//  FeedLoaderStub.swift
//  EssentialDevAppTests
//
//  Created by Min-Yang Huang on 5/3/25.
//

import Foundation
import EssentialDev

class FeedLoaderStub: FeedLoader {
    private let result: FeedLoader.Result

    init(result: FeedLoader.Result) {
        self.result = result
    }

    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
