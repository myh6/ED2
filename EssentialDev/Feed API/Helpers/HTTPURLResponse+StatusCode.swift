//
//  HTTPURLResponse+StatusCode.swift
//  EssentialDev
//
//  Created by Min-Yang Huang on 4/29/25.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
