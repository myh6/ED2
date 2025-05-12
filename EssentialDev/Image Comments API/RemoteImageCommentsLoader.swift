//
//  RemoteImageCommentsLoader.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 5/11/25.
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
    }
}
