//
//  HTTPClient.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 2024/1/10.
//

import Foundation

public enum HTTPClientResult {
    case success((Data, HTTPURLResponse))
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
