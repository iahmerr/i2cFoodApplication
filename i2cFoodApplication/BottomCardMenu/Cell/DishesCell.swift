//
//  DishesCell.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 02/09/2022.
//

import SwiftUI

struct DishesCell<ViewModel: DishesCellViewModelType>: View {
    
    @ObservedObject
    private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            
            Text(viewModel.menuName)
            
            Spacer()
            
            Text(viewModel.dishName)
        }
    }
}


struct DishesCell_Previews: PreviewProvider {
    static var previews: some View {
        DishesCell(viewModel: DishesCellViewModel(menuName: "Main Dish", dishName: "Karahi")).previewLayout(.sizeThatFits)
    }
}
