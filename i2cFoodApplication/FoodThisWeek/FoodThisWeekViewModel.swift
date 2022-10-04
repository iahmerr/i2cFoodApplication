//
//  FoodThisWeekViewModel.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 07/09/2022.
//

import Foundation
import Combine

protocol FoodThisWeekViewModelType: ObservableObject {
    var menu: [Food] { get set }
    var isLunch: Bool { get set }
    var segmentSelection: Int { get set }
}

final class FoodThisWeekViewModel: FoodThisWeekViewModelType {
    
    @Published
    var menu: [Food] = []
    @Published
    var segmentSelection = 0
    @Published
    var isLunch: Bool = false
    
    private var lunch: [Food] = []
    private var dinner: [Food] = []
    private var cancellables: [AnyCancellable] = []
    
    init(lunch: [Food], dinner: [Food] ){
        self.menu = lunch
        self.lunch = lunch
        self.dinner = dinner
        
        $segmentSelection.sink {[weak self] value in
            guard let self = self else { return }
            self.menu = (value == 0) ? self.lunch : self.dinner
            self.isLunch = (value == 0) ? true : false
        }.store(in: &cancellables)
    }
}
