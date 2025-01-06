//
//  HeroListViewModel.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 06/01/2025.
//

import Foundation
import Observation

@Observable
class HeroListViewModel{
    var heroes: [Hero] = []
    
    func getHeroes() async throws {
        do{
            heroes = try await NetworkService.shared.fetchHeroes()
        }catch{
            print(error)
        }
    }
    
        init(){
            print("Hero List Init")
        }
    deinit{
        print("Hero List deInit")
    }
    
}
