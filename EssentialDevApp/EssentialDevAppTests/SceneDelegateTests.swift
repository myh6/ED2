//
//  SceneDelegateTests.swift
//  EssentialDevAppTests
//
//  Created by Min-Yang Huang on 5/6/25.
//

import XCTest
import EssentialDeviOS
@testable import EssentialDevApp

class SceneDelegateTests: XCTestCase {
    func test_configureWindow_setsWindowAsKeyAndVisible() {
        let window = UIWindowSpy()
        let sut = SceneDelegate()
        sut.window = window
        
        sut.configureWindow()
        
        XCTAssertEqual(window.makeKeyAndVisibleCount, 1, "Expected to make window key and visible")
    }
    
    func test_sceneWillConnectToSession_configuresRootViewController() {
        let sut = SceneDelegate()
        sut.window = UIWindow()
        
        sut.configureWindow()
        
        let root = sut.window?.rootViewController
        let rootNavigation = root as? UINavigationController
        let topController = rootNavigation?.topViewController
        
        XCTAssertNotNil(rootNavigation, "Expected a navigation controller as root, got \(String(describing: root)) instead")
        XCTAssertTrue(topController is FeedViewController, "Expected a feed controller as top view controller, got \(String(describing: topController)) instead")
    }
    
    //MARK: - Helpers
    private class UIWindowSpy: UIWindow {
        var makeKeyAndVisibleCount = 0
        
        override func makeKeyAndVisible() {
            makeKeyAndVisibleCount += 1
        }
    }

}
