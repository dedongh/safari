//
//  CoverImageView.swift
//  Africa
//
//  Created by Bra Emma on 06/05/2021.
//

import SwiftUI

struct CoverImageView: View {
    var body: some View {
        let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
        TabView{
            ForEach(coverImages.shuffled()){item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    
    }
}


struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
