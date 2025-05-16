//
//  ImageCommentsLocalizationTests.swift
//  EssentialDevTests
//
//  Created by Min-Yang Huang on 5/15/25.
//

import XCTest
import EssentialDev

class ImageCommentsLocalizationTests: XCTestCase {
    
    func test_localizedString_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "ImageComments"
        let bundle = Bundle(for: ImageCommentsPresenter.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
}
