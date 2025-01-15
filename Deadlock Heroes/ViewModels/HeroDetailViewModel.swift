//
//  HeroDetailViewModel.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 06/01/2025.
//

import Foundation
import Observation

@Observable
class HeroDetailViewModel {
    var abilities: [HeroAbility] = []
    func getAbilities(_ heroId: Int) async throws {
        do{
            abilities = try await NetworkService.shared.fetchAbilities(heroId)
        }catch{
            print(error)
        }
    }
}
