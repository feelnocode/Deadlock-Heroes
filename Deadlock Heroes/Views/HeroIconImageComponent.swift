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
            CacheImage(url: URL(string: imageUrl))
                .frame(width: 65, height: 65)
                .clipShape(.circle)
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
