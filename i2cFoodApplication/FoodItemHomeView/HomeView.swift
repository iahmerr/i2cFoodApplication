//
//  ContentView.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 01/09/2022.
//

import SwiftUI

struct HomeView: View {
    
    private let sides = UIScreen.main.bounds
    
    let service = FoodMenuService()
    var body: some View {
        
        VStack {
            
            SliderView()
                .frame(width: sides.width, height: sides.height * 0.65)
            
            MenuCardForTheDay(viewModel: MenuCardViewModel(service: FoodMenuService()))
                .frame(width: sides.width, height: self.sides.height * 0.5, alignment: .center)
                .offset(y: -30).ignoresSafeArea()
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .background(.gray.opacity(0.3))

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
