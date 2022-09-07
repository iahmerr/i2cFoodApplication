//
//  DishesCellViewModel.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 05/09/2022.
//

import Foundation

final class DishesCellViewModel: ObservableObject {
    
    var menuName: String
    var dishName: String
    
    init(menuName: String, dishName: String) {
        self.menuName = menuName
        self.dishName = dishName
    }
    
}
