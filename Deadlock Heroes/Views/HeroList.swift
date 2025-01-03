//
//  HeroList.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 01/01/2025.
//

import SwiftUI

struct HeroList: View {
    let heroQuery: HeroQuery
    var body: some View {
        List(heroQuery.heroes){hero in
            NavigationLink {
                HeroDetailView(hero: hero)
            } label: {
                HeroListRow(hero: hero)
            }
        }
    }
}

#Preview {
    HeroList(heroQuery: HeroQuery.EXAMPLE_QUERY)
}
