//
//  SharedTestHelpers.swift
//  EssentialDevTests
//
//  Created by Min-Yang Huang on 2024/2/6.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}
