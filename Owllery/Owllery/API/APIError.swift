//
//  APIError.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 18/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case invalidUrl
    case couldNotDecode
    case failedRequest
    case unknowError (statuscode: Int)
}
