//
//  WebServiceMock.swift
//  MarleySpoonTests
//
//  Created by AhmedFitoh on 9/1/21.
//

import Foundation
@testable import MarleySpoon

class WebServiceMock: WebService{
    
    var expectedError: APIError?
    
    override func fetch<T>(with router: Endpoints,
                           decode: @escaping (Decodable) -> T?,
                           completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable {
        if expectedError != nil  {
            completion(.failure(expectedError!))
            return
        }
        var stubFileName = ""
        switch router {
        case .recipeList:
            stubFileName = "RecipeList_Stub"
        }
        
        if let data = Bundle().loadDataFromBundle(withName: stubFileName, ext: "json") {
            if let model = try? JSONDecoder().decode(T.self, from: data) {
                completion(.success(model))
            } else {
                completion(.failure(.jsonParsingFailure))
            }
        } else {
            completion(.failure(.requestFailed(description: "Couldn't find stub file in bundle")))
            debugPrint("WebServiceMock couldn't load data")
        }
    }
}

