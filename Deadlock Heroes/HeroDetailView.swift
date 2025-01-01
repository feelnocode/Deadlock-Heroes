//
//  HeroDetailView.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 01/01/2025.
//

import SwiftUI

struct HeroDetailView: View {
    let hero: Hero
    var body: some View {
        Text(hero.name)
            .font(.headline)
    }
}

#Preview {
    HeroDetailView(hero: Hero.EXAMPLE_HERO)
}
