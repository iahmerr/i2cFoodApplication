//
//  DishesCellViewModel.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 05/09/2022.
//

import Foundation

protocol DishesCellViewModelType: ObservableObject {
    var menuName: String { get set }
    var dishName: String { get set }
}

final class DishesCellViewModel: DishesCellViewModelType {
    
    var menuName: String
    var dishName: String
    
    init(menuName: String, dishName: String) {
        self.menuName = menuName
        self.dishName = dishName
    }
    
}
