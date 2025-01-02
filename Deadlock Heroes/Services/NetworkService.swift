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
    let url = URL(string: "https://assets.deadlock-api.com/v2/heroes?language=english&client_version=5448&only_active=false")
    var heroesResult = HeroQuery(heroes: [])
    
    func fetchHeroes() async throws {
        let (data, response) = try await URLSession.shared.data(from: url!)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {throw APIErrors.invalidResponseCode}
        
        do{
            heroesResult.heroes = try JSONDecoder().decode([Hero].self, from: data)
        } catch {
            print(error)
            throw APIErrors.decodingError
        }
    }
}
