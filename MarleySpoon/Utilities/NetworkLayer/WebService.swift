//
//  WebService.swift
//  MarleySpoon
//
//  Created by AhmedFitoh on 9/1/21.
//

import Foundation

class WebService {
    /// URLSession Object
    private var session: URLSession = URLSession(configuration: .default)
    ///CompletionHandler
    private typealias JSONTaskCompletionHandler = (Decodable?, APIError?) -> Void
    /// Decode Object
    /// - Parameters:
    ///   - request: URLRequest object
    ///   - decodingType: decodable type
    ///   - completion: CompletionHandler with Decodable and APIError
   private func decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed(description: error.debugDescription))
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let genericModel = try decoder.decode(decodingType, from: data)
                        completion(genericModel, nil)
                    } catch let error {
                        print(error)
                        completion(nil, .jsonConversionFailure(description: error.localizedDescription))
                    }
                } else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .responseUnsuccessful(description: "status code = \(httpResponse.statusCode)"))
            }
        }
        return task
    }
    
    //MARK:- Make request and get Decodable Object
    func fetch<T: Decodable>(with router: Endpoints, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>) -> Void) {
        let request = router.asRequest()
        let task = decodingTask(with: request, decodingType: T.self) { (json , error) in
            ///change to main queue
            DispatchQueue.main.async {
                guard let json = json else {
                    if let error = error {
                        completion(Result.failure(error))
                    } else {
                        completion(Result.failure(.invalidData))
                    }
                    return
                }
                if let value = decode(json) {
                    completion(.success(value))
                } else {
                    completion(.failure(.jsonParsingFailure))
                }
            }
        }
        task.resume()
    }
    
    //MARK:- Fetch requested items
    func fetchRequestedItems<T: Decodable>(router: Endpoints,
                                           value: T.Type,
                                           completionHandler: @escaping (Result<T, APIError>) -> Void) {
        self.fetch(with: router, decode: { json -> T? in
            guard let resource = json as? T else { return nil }
            return resource
        }, completion: completionHandler)
    }
    
}
