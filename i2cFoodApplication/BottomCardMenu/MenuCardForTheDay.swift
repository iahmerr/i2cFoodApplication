//
//  MenuCardForTheDay.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 02/09/2022.
//

import SwiftUI
import Combine

struct MenuCardForTheDay: View {
    
    @State var isToggle: Bool = false
    @ObservedObject
    var viewModel: MenuCardViewModel
    
    var body: some View {
        
        VStack {
            
            Text(viewModel.headerText).frame(maxWidth: .infinity, alignment: .leading).padding()
            
            Picker("What is your favorite color?", selection: self.$viewModel.segmentSelection) {
                            Text("Lunch").tag(0)
                            Text("Dinner").tag(1)
            }
            .pickerStyle(.segmented).padding([.leading, .trailing])
            
            List {
                Section(header: Text(viewModel.firstSectionHeader)) {
                    DishesCell(viewModel: DishesCellViewModel(menuName: "Main Dish", dishName: viewModel.foodMenu?.mainDish ?? ""))
                    DishesCell(viewModel: DishesCellViewModel(menuName: "Side Dish", dishName: viewModel.foodMenu?.sideDish ?? ""))
                    DishesCell(viewModel: DishesCellViewModel(menuName: "Sweet Dish", dishName: viewModel.foodMenu?.sweet ?? ""))
                }
            }.listStyle(.plain).frame(width: UIScreen.main.bounds.width , height: 200, alignment: .center)
            
            Button("Look what we offer this whole week") {
                print("looking")
                isToggle.toggle()
            }.foregroundColor(.blue)
                .sheet(isPresented: self.$isToggle) {
                    FoodThisWeek(viewModel: FoodThisWeekViewModel(lunch: viewModel.upcomingLunchMenus, dinner: viewModel.upcomingDinnerMenus))
                }.padding(.bottom, 30)
            
        }.frame(maxWidth: .infinity)
            .ignoresSafeArea()
            .background(Color.white)
            .padding(.bottom, 20)
            .cornerRadius(20)
            .padding(.bottom, -20)
            .padding(.top)
            .shadow(radius: 7)

    }
}

struct MenuCardForTheDay_Previews: PreviewProvider {
    static var previews: some View {
        MenuCardForTheDay(viewModel: MenuCardViewModel(service: FoodMenuService())).previewLayout(.sizeThatFits)
    }
}
