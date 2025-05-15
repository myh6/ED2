//
//  FeedImagePresenterTests.swift
//  EssentialDevTests
//
//  Created by Min-Yang Huang on 4/27/25.
//

import XCTest
import EssentialDev

class FeedImagePresenterTests: XCTestCase {
    
    func test_map_createsViewModel() {
        let image = uniqueImage()
        
        let viewModel = FeedImagePresenter.map(image)
        
        XCTAssertEqual(viewModel.description, image.description)
        XCTAssertEqual(viewModel.location, image.location)
    }
}
