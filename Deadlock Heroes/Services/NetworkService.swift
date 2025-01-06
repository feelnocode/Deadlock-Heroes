//
//  NetworkService.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 01/01/2025.
//

import Foundation
import Observation

@Observable
class NetworkService {
    
    static let shared = NetworkService()
    let url = URL(string: "https://assets.deadlock-api.com/v2/heroes?language=english&client_version=5448&only_active=false")
    
    func fetchHeroes() async throws -> [Hero]{
        let (data, response) = try await URLSession.shared.data(from: url!)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {throw APIErrors.invalidResponseCode}
        
        do{
            return try JSONDecoder().decode([Hero].self, from: data)
        } catch {
            print(error)
            throw APIErrors.decodingError
        }
    }
    func fetchAbilities(_ heroId: Int) async throws -> [HeroAbility]{
        let abilitiesUrl = URL(string: "https://assets.deadlock-api.com/v2/items/by-hero-id/\(heroId)")
        
        let (data, response) = try await URLSession.shared.data(from: abilitiesUrl!)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {throw APIErrors.invalidResponseCode}
        
        do {
            return try JSONDecoder().decode([HeroAbility].self, from: data).filter({$0.description?.desc != nil})
        } catch {
            print(error)
            throw APIErrors.decodingError
        }
    }
}



