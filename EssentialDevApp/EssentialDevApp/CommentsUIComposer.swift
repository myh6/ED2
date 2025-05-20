//
//  CommentsUIComposer.swift
//  EssentialDevApp
//
//  Created by Min-Yang Huang on 5/20/25.
//

import UIKit
import Combine
import EssentialDev
import EssentialDeviOS

public final class CommentsUIComposer {
    private init() {}
    
    private typealias FeedPresentationAdapter = LoadResourcePresentationAdapter<[FeedImage], FeedViewAdapter>
    
    public static func commentsComposedWith(
        commentsLoader: @escaping () -> AnyPublisher<[FeedImage], Error>) -> ListViewController {
            let presentationAdapter = FeedPresentationAdapter(loader: commentsLoader)
            
            let feedController = makeWith(title: ImageCommentsPresenter.title)
            feedController.onRefresh = presentationAdapter.loadResource
            
            presentationAdapter.presenter = LoadResourcePresenter(
                resourceView: FeedViewAdapter(
                    controller: feedController,
                    imageLoader: { _ in Empty<Data, Error>().eraseToAnyPublisher() }),
                loadingView: WeakRefVirtualProxy(feedController),
                errorView: WeakRefVirtualProxy(feedController),
                mapper: FeedPresenter.map)
            
            return feedController
    }

    private static func makeWith(title: String) -> ListViewController {
        let bundle = Bundle(for: ListViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! ListViewController
        feedController.title = title
        
        return feedController
    }
}

