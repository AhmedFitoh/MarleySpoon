//
//  APIError.swift
//  MarleySpoon
//
//  Created by AhmedFitoh on 9/1/21.
//

import Foundation

enum APIError: Error {
    case requestFailed(description: String)
    case jsonConversionFailure(description: String)
    case invalidData
    case responseUnsuccessful(description: String)
    case jsonParsingFailure
    case createURLRequestFailed(error: NSError)
    
    var customDescription: String {
        switch self {
        case .requestFailed(let desc): return "Request Failed error -> \(desc)"
        case .invalidData: return "Invalid Data error)"
        case .responseUnsuccessful(let desc): return "Response Unsuccessful error -> \(desc)"
        case .jsonParsingFailure: return "JSON Parsing Failure error"
        case .jsonConversionFailure(let desc): return "JSON Conversion Failure -> \(desc)"
        case .createURLRequestFailed(let error): return "Invalid URL Failure -> \(error.localizedDescription)"
        }
    }
}
