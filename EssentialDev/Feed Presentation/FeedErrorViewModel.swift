//
//  FeedErrorViewModel.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 4/27/25.
//

public struct FeedErrorViewModel {
    public let message: String?

    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
