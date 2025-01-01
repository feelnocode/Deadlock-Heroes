//
//  HeroIconImageComponent.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 01/01/2025.
//

import SwiftUI

struct HeroIconImageComponent: View {
    let hero: Hero
    var body: some View {
        if let imageUrl = hero.images.heroIcon{
            AsyncImage(url: URL(string:imageUrl)){image in
                image.resizable()
                    .frame(width: 65, height: 65)
                    .clipShape(.circle)
            }placeholder: {
                ProgressView()
            }
        }else{
            Image("No_Image_Available")
                .resizable()
                .frame(width: 65, height: 65)
                .clipShape(.circle)
        }
    }
}

#Preview {
    HeroIconImageComponent(hero: Hero.EXAMPLE_HERO)
}
