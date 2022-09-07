//
//  APIClient.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 06/09/2022.
//

import Foundation
import Combine

protocol APIClientType {
    func request<T:Decodable>(router: URLRequestConvertibleType) -> AnyPublisher<T,NetworkRequestError>
}

final class APIClient: APIClientType {
    
    func request<T>(router: URLRequestConvertibleType) -> AnyPublisher<T, NetworkRequestError> where T : Decodable {
        let urlRequest = (try? router.urlRequest())!

        return URLSession.shared.dataTaskPublisher(for : urlRequest ).map { a in a.data }.decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let error = error as? NetworkRequestError {
                    return error
                } else {
                    return NetworkRequestError.serverError(error: error.localizedDescription)
                }
            }
            .eraseToAnyPublisher()
    }
    
}
