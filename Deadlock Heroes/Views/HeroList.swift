//
//  HeroList.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 01/01/2025.
//

import SwiftUI

struct HeroList: View {
    var viewModel = HeroListViewModel()
    var body: some View {
        List(viewModel.heroes){hero in
            NavigationLink {
                HeroDetailView(hero: hero)
            } label: {
                HeroListRow(hero: hero)
            }
        }
        .navigationTitle("Heroes List")
        .refreshable {
            Task{
                do{
                    print("making request")
                    try await viewModel.getHeroes()
                }catch{}
            }
        }.task {
            do{
                print("making request")
                try await viewModel.getHeroes()
            }catch{}
        }
    }
}

#Preview {
    HeroList()
}
