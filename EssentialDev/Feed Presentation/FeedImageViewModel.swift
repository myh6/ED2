//
//  FeedImageViewModel.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 4/27/25.
//

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?

    public var hasLocation: Bool {
        return location != nil
    }
}
