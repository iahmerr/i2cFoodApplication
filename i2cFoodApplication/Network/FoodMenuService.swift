//
//  FoodMenuService.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 05/09/2022.
//

import Foundation
import Combine

protocol FoodMenuServiceType {
    func getMenu()->AnyPublisher<MenuResponse, NetworkRequestError>
}

final class FoodMenuService: FoodMenuServiceType {
    
    private let apiClient: APIClientType
    
    init(apiClient: APIClientType = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getMenu() -> AnyPublisher<MenuResponse, NetworkRequestError> {
        let req = Endpoint(route: .monthlyMenu, method: .get)
        return apiClient.request(router: req).eraseToAnyPublisher()
    }
}
