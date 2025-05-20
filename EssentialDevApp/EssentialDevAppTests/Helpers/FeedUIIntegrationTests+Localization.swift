//
//  FeedViewControllerTests+Localization.swift
//  EssentialDeviOSTests
//
//  Created by Min-Yang Huang on 4/25/25.
//

import Foundation
import XCTest
import EssentialDev

extension FeedUIIntegrationTests {
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }
    
    var loadError: String {
        LoadResourcePresenter<Any, DummyView>.loadError
    }
    
    var feedTitle: String {
        FeedPresenter.title
    }
    
    var commentsTitle: String {
        ImageCommentsPresenter.title
    }
}
