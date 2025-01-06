//
//  HeroCardImageComponent.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 06/01/2025.
//

import SwiftUI

struct HeroCardImageComponent: View {
    let imageUrl: String?
    var body: some View {
        if let imageUrl = imageUrl {
            CacheImage(url: URL(string: imageUrl))
                .frame(width: 350, height: 350)
                .clipShape(.rect(cornerRadius: 10))
                .shadow(radius: 5)
                .padding()
        }else{
            Image("No_Image_Available")
                .resizable()
                .frame(width: 350, height: 350)
                .clipShape(.rect(cornerRadius: 10))
                .padding()
        }
    }
}

#Preview {
    HeroCardImageComponent(imageUrl: "fake url")
}
