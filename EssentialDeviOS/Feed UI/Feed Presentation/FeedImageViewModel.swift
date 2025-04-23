//
//  FeedImageViewModel.swift
//  EssentialDeviOS
//
//  Created by Min-Yang Huang on 4/21/25.
//

import Foundation
import EssentialDev

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
