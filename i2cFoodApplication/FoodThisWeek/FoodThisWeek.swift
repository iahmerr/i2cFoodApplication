//
//  FoodThisWeek.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 07/09/2022.
//

import SwiftUI

struct FoodThisWeek<ViewModel: FoodThisWeekViewModelType> : View {
    
    @ObservedObject
    private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Picker("", selection: self.$viewModel.segmentSelection) {
                Text("Lunch").tag(0)
                Text("Dinner").tag(1)
            }
            .pickerStyle(.segmented).padding([.leading, .trailing, .top])
            
            Form {
                ForEach(viewModel.menu, id: \.date) { food in
                    Section {
                        DishesCell(viewModel: DishesCellViewModel(menuName: "Main Dish", dishName: food.mainDish))
                        DishesCell(viewModel: DishesCellViewModel(menuName: "Side Dish", dishName: food.sideDish))
                        DishesCell(viewModel: DishesCellViewModel(menuName: "Sweet Dish", dishName: food.sweet))
                    } header: {
                        HStack {
                            Text(food.date)
                            
                            Spacer()
                            
                            Text(food.day)
                        }
                    }
                }
                
            }
        }.padding(.top)
    }
}

struct FoodThisWeek_Previews: PreviewProvider {
    static var previews: some View {
        FoodThisWeek(viewModel: FoodThisWeekViewModel(lunch: [], dinner: []))
    }
}
