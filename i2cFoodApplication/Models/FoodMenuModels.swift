//
//  FoodMenuModels.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 06/09/2022.
//

import Foundation
struct FoodMenu: Decodable {
    let food: [Food]
}

// MARK: - Food
struct Food: Decodable, Hashable {
    let date, day, mainDish, sideDish: String
    let sweet: String

    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case day = "Day"
        case mainDish = "Main Dish"
        case sideDish = "Side Dish"
        case sweet = "Sweet"
    }
}
