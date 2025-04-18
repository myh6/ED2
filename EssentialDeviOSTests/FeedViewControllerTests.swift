//
//  EssentialDeviOSTests.swift
//  EssentialDeviOSTests
//
//  Created by Min-Yang Huang on 4/18/25.
//

import XCTest
import UIKit
import EssentialDev
@testable import EssentialDeviOS

final class FeedViewController: UITableViewController {
    private var loader: FeedLoader?
    
    convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        refresh()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        refreshControl?.beginRefreshing()
        load()
    }
    
    @objc private func refresh() {
        refreshControl?.beginRefreshing()
        load()
    }
    
    private func load() {
        loader?.load { [weak self] _ in
            self?.refreshControl?.endRefreshing()
        }
    }
}

final class FeedViewControllerTests: XCTestCase {
    
    func test_init_doesNotLoadFeed() {
        let (_, loader) = makeSUT()
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
    
    func test_viewDidLoad_loadsFeed() {
        let (sut, loader) = makeSUT()
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(loader.loadCallCount, 1)
    }
    
    func test_userInitiatedFeedReload_reloadsFeed() {
        let (sut, loader) = makeSUT()
        sut.loadViewIfNeeded()
        
        sut.simulateUserInitiatedFeedReload()
        
        XCTAssertEqual(loader.loadCallCount, 2)
    }
    
    func test_viewDidLoad_showsLoadingIndicator() {
        let (sut, _) = makeSUT()
        
        sut.loadViewIfNeeded() // viewDidLoad
        XCTAssertEqual(sut.refreshControl?.isRefreshing, false)
        
        sut.replaceRefreshControlWithFakeForiOS17Support()
        sut.beginAppearanceTransition(true, animated: false) // viewWillAppear
        sut.endAppearanceTransition() // viewIsAppearing+viewDidAppear
        
        XCTAssertEqual(sut.isShowingLoadingIndicator, true)
    }
    
    func test_viewDidLoad_hidesLoadingIndicatiorOnLoaderCompletion() {
        let (sut, loader) = makeSUT()
        sut.loadViewIfNeeded()
        
        loader.completeLoading()
        
        XCTAssertEqual(sut.isShowingLoadingIndicator, false)
    }
    
    func test_userInitiatedFeedReload_showsLoadingIndicator() {
        let (sut, _) = makeSUT()
        
        sut.replaceRefreshControlWithFakeForiOS17Support()
        sut.simulateUserInitiatedFeedReload()
        
        XCTAssertEqual(sut.isShowingLoadingIndicator, true)
    }
    
    func test_userInitiatedFeedReload_hidesLoadingIndicatorOnLoaderCompletion() {
        let (sut, loader) = makeSUT()
        
        sut.replaceRefreshControlWithFakeForiOS17Support()
        sut.simulateUserInitiatedFeedReload()
        loader.completeLoading()
        
        XCTAssertEqual(sut.isShowingLoadingIndicator, false)
    }
    
    //MARK: - Helpers
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: FeedViewController, loader: LoaderSpy) {
        let loaderSpy = LoaderSpy()
        let sut = FeedViewController(loader: loaderSpy)
        trackForMemoryLeaks(loaderSpy, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, loaderSpy)
    }
    
    class LoaderSpy: FeedLoader {
        private(set) var loadCallCount = 0
        private var completions = [(FeedLoader.Result) -> Void]()
        
        func load(completion: @escaping (FeedLoader.Result) -> Void) {
            loadCallCount += 1
            completions.append(completion)
        }
        
        func completeLoading(at index: Int = 0) {
            completions[index](.success([]))
        }
    }

}

private class FakeRefreshControl: UIRefreshControl {
    private var _isRefreshing: Bool = false
    
    override var isRefreshing: Bool {
        return _isRefreshing
    }
    
    override func beginRefreshing() {
        _isRefreshing = true
    }
    
    override func endRefreshing() {
        _isRefreshing = false
    }
}

extension UIRefreshControl {
    func simulatePullToRefresh() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .valueChanged)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}

private extension FeedViewController {
    var isShowingLoadingIndicator: Bool {
        return refreshControl?.isRefreshing == true
    }
    
    func replaceRefreshControlWithFakeForiOS17Support() {
        let fake = FakeRefreshControl()
        
        refreshControl?.allTargets.forEach{ target in
            refreshControl?.actions(forTarget: target, forControlEvent: .valueChanged)?.forEach{ action in
                fake.addTarget(target, action: Selector(action), for: .valueChanged)
            }
        }
        refreshControl = fake
    }
    
    func simulateUserInitiatedFeedReload() {
        refreshControl?.simulatePullToRefresh()
    }
}
