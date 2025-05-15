//
//  FeedImagePresenter.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 4/27/25.
//

import Foundation

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        return FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
