//
//  DishesCell.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 02/09/2022.
//

import SwiftUI

struct DishesCell: View {
    
    @ObservedObject var viewModel: DishesCellViewModel
    
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
