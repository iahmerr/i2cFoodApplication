//
//  ContentView.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 01/09/2022.
//

import SwiftUI

struct HomeView: View {
    
    private let sides = UIScreen.main.bounds
    
    var body: some View {
        
        VStack(spacing: -25) {
            SliderView()
                .frame(width: sides.width)
            
            MenuCardForTheDay(viewModel: MenuCardViewModel(service: FoodMenuService()))
                .frame(width: sides.width, alignment: .center)
                .ignoresSafeArea()
            
            Spacer()
            
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
