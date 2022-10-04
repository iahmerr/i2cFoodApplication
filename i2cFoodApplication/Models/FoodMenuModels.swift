//
//  FoodMenuModels.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 06/09/2022.
//

import Foundation

struct MenuResponse: Decodable {
    let lunch, dinner: [Food]

    enum CodingKeys: String, CodingKey {
        case lunch = "Lunch"
        case dinner = "Dinner"
    }
}

// MARK: - Dinner
struct Food: Decodable {
    let dinnerDate: String?
    let day, mainDish: String
    let sideDish: String?
    let sweetDish: String
    let lunchDate: String?

    enum CodingKeys: String, CodingKey {
        case dinnerDate = "Dinner Menu m/o OCT-22"
        case day = "Column2"
        case mainDish = "Column3"
        case sideDish = "Column4"
        case sweetDish = "Column5"
        case lunchDate = "Lunch Menu m/o OCT-22"
    }
}

