//
//  TrialsError.swift
//  Trials Australia
//
//  Created by Matt Langtree on 8/1/19.
//  Copyright © 2019 Matt Langtree. All rights reserved.
//

import Foundation

enum TrialsError: Error {
    // Parsing JSON into model object
    case dataError
    case notAuthorised
    // Internet Connectivity, DNS, SSL, etc. Also received by reachability check
    case networkError
    // http status code and message
    case clientError(Int, String)
    // Server unable to handle request or other configuration error
    case serverError
    case otherError

    func errorTitle() -> String {
        switch self {
        case .networkError:
            return "No Internet Connection"
        case .clientError(_, _):
            return "Error"
        default:
            return "Internal Error"
        }
    }

    func errorDescription() -> String {
        switch self {
        case .networkError:
            return "Make sure your device is connected to the internet."
        case .clientError(403, let reason):
            return reason
        case .clientError(_, let reason):
            return reason
        default:
            return "An internal error occurred. Please try again later."
        }
    }
}
