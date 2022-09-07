//
//  SliderView.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 02/09/2022.
//

import SwiftUI

struct SliderView: View {
    
    @State var index = 0
    
    var images = ["image-1", "image-2", "image-3", "image-4"]
    
    var body: some View {
        VStack {
            PagingView(index: $index.animation(), maxIndex: images.count - 1) {
                
                ForEach(self.images, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                }
            }
            
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView().previewLayout(.sizeThatFits)
    }
}
