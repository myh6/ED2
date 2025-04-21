//
//  FeedViewModel.swift
//  EssentialDeviOS
//
//  Created by Min-Yang Huang on 4/21/25.
//

import Foundation
import EssentialDev

final class FeedViewModel {
    private let feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    var onChange: ((FeedViewModel) -> Void)?
    var onFeedload: (([FeedImage]) -> Void)?
    
    private(set) var isLoading: Bool = false {
        didSet { onChange?(self) }
    }
    
    func loadFeed() {
        isLoading = true
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onFeedload?(feed)
            }
            self?.isLoading = false
        }
    }
}
