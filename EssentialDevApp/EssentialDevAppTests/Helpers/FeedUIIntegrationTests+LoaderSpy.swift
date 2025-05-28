//
//  FeedViewControllerTests+LoaderSpy.swift
//  EssentialDeviOSTests
//
//  Created by Min-Yang Huang on 4/20/25.
//

import Foundation
import Combine
import EssentialDev
import EssentialDeviOS

class LoaderSpy {
    //MARK: - FeedLoader
    var loadFeedCallCount: Int {
        return feedRequests.count
    }
    
    private var feedRequests = [PassthroughSubject<Paginated<FeedImage>, Error>]()
    
    func loadPublisher() -> AnyPublisher<Paginated<FeedImage>, Error> {
        let publisher = PassthroughSubject<Paginated<FeedImage>, Error>()
        feedRequests.append(publisher)
        return publisher.eraseToAnyPublisher()
    }
    
    func completeFeedLoading(with feed: [FeedImage] = [], at index: Int = 0) {
        feedRequests[index].send(Paginated(items: feed, loadMorePublisher: { [weak self] in
            self?.loadMorePublisher() ?? Empty().eraseToAnyPublisher()
        }))
        feedRequests[index].send(completion: .finished)
    }
    
    func completeFeedLoadingWithError(at index: Int = 0) {
        feedRequests[index].send(completion: .failure(anyNSError()))
    }
    
    //MARK: - LoadMoreFeedLoader
    
    var loadMoreCallCount: Int {
        return loadMoreRequests.count
    }
    
    private var loadMoreRequests = [PassthroughSubject<Paginated<FeedImage>, Error>]()
    
    func loadMorePublisher() -> AnyPublisher<Paginated<FeedImage>, Error> {
        let publisher = PassthroughSubject<Paginated<FeedImage>, Error>()
        loadMoreRequests.append(publisher)
        return publisher.eraseToAnyPublisher()
    }
    
    func completeLoadMore(with feed: [FeedImage] = [], lastPage: Bool = false, at index: Int = 0) {
        loadMoreRequests[index].send(Paginated(
            items: feed,
            loadMorePublisher: lastPage ? nil : { [weak self] in
                self?.loadMorePublisher() ?? Empty().eraseToAnyPublisher()
            }))
    }
    
    func completeLoadMoreWithError(at index: Int = 0) {
        loadMoreRequests[index].send(completion: .failure(anyNSError()))
    }
    
    
    //MARK: - FeedImageDataLoader
    private var imageRequests = [(url: URL, publisher: PassthroughSubject<Data, Error>)]()
    
    var loadedImageURLs: [URL] {
        return imageRequests.map { $0.url }
    }
    
    private(set) var cancelledImageURLs = [URL]()
    
    func loadImageDataPublisher(from url: URL) -> AnyPublisher<Data, Error> {
        let publisher = PassthroughSubject<Data, Error>()
        imageRequests.append((url, publisher))
        return publisher.handleEvents(receiveCancel: { [weak self] in
            self?.cancelledImageURLs.append(url)
        }).eraseToAnyPublisher()
    }
    
    func completeImageLoading(with imageData: Data = Data(), at index: Int = 0) {
        imageRequests[index].publisher.send(imageData)
        imageRequests[index].publisher.send(completion: .finished)
    }
    
    func completeImageLoadingWithError(at index: Int = 0) {
        imageRequests[index].publisher.send(completion: .failure(anyNSError()))
    }
}
