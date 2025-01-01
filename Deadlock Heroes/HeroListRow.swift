//
//  HeroListRow.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 01/01/2025.
//

import SwiftUI

struct HeroListRow: View {
    let hero: Hero
    var body: some View {
        HStack{
            HeroIconImageComponent(hero: hero)
            .padding(.leading, 10)
            Text(hero.name)
                .padding(.leading,20)
                .font(.headline)
            Spacer()
        }
    }
}

#Preview {
    HeroListRow(hero: Hero.EXAMPLE_HERO)
}
