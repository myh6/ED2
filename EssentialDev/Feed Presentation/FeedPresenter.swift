//
//  FeedPresenter.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 4/27/25.
//

import Foundation

public final class FeedPresenter {
    public static var title: String {
        return NSLocalizedString("FEED_VIEW_TITLE",
            tableName: "Feed",
            bundle: Bundle(for: FeedPresenter.self),
            comment: "Title for the feed view")
    }
}
