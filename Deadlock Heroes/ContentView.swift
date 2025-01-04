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
            HeroList(heroQuery: networkService.heroesResult, networkService: networkService)
                .navigationTitle("Heroes List")
                .refreshable {
                    Task{
                        do{
                            print("making request")
                            try await networkService.fetchHeroes()
                        }catch{}
                    }
                }.task {
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
