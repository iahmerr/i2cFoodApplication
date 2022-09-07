//
//  FoodMenuService.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 05/09/2022.
//

import Foundation
import Combine

protocol FoodMenuServiceType {
    func getLunchMenu()-> AnyPublisher<FoodMenu, NetworkRequestError>
    func getDinnerMenu()-> AnyPublisher<FoodMenu, NetworkRequestError>
}

final class FoodMenuService: FoodMenuServiceType {
    
    private let apiClient: APIClientType
    
    init(apiClient: APIClientType = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getLunchMenu() -> AnyPublisher<FoodMenu, NetworkRequestError> {
        let router: Endpoint = Endpoint(route: .getLunchMenu, method: .get)
        return apiClient.request(router: router).eraseToAnyPublisher()
    }
    
    func getDinnerMenu() -> AnyPublisher<FoodMenu, NetworkRequestError> {
        let router: Endpoint = Endpoint(route: .getDinnerMenu, method: .get)
        return apiClient.request(router: router).eraseToAnyPublisher()
    }
}
