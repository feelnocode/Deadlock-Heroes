//
//  ContentView.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 01/01/2025.
//

import SwiftUI

struct ContentView: View {
    var networkService = NetworkService()
    var body: some View {
        NavigationStack{
            HeroList(heroQuery: networkService.heroesResult)
                .navigationTitle("Heroes List")
        }.task {
            do{
                print("making request")
                try await networkService.fetchHeroes()
            }catch{}
        }
        .refreshable {
            Task{
                do{
                    print("making request")
                    try await networkService.fetchHeroes()
                }catch{}
            }
        }
    }
}

#Preview {
    ContentView()
}
