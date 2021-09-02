//
//  Endpoints.swift
//  MarleySpoon
//
//  Created by AhmedFitoh on 9/1/21.
//

import Foundation


enum Endpoints {
    case recipeList
}

extension Endpoints{
    //MARK:- Base Url

    var baseUrl: String{
        return  "https://cdn.contentful.com/spaces/\(Constants.APIConfig.spaceId)/environments/\(Constants.APIConfig.environment)/"
    }
    
    
    //MARK:- Get url string
    var urlString : String {
        switch self {
        case .recipeList:
            return baseUrl + "entries?content_type=recipe"
        }
    }
    
    //MARK:- HTTP Method

    var httpMethod: String {
        switch self {
        case .recipeList:
            return "GET"
        }
    }
    
    //MARK:- Create Request
    func asRequest() -> URLRequest {
        guard let url = URL(string: self.urlString) else {
            fatalError("invalid url string")
        }
        ///Create URL Request with given URL
        var urlRequest = URLRequest(url: url)
        ///add http method
        urlRequest.httpMethod = self.httpMethod
        ///add authentication token in header
        urlRequest.setValue("Bearer \(Constants.APIConfig.accessToken)", forHTTPHeaderField: "Authorization")
        ///return request
        return urlRequest
    }
    
}
