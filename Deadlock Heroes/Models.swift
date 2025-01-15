//
//  Hero.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 01/01/2025.
//

import Foundation


struct Hero: Codable, Identifiable {
    let id: Int
    let name: String
    let description: ExtendedDescription
    let images: HeroImageSet
    
    struct HeroImageSet: Codable {
        let heroCard: String?
        let heroIcon: String?
        
        enum CodingKeys: String, CodingKey {
            case heroCard = "selection_image"
            case heroIcon = "icon_image_small"
        }
    }
    struct ExtendedDescription: Codable {
        let lore: String?
    }
    
}


struct HeroAbility: Codable, Identifiable{
    let id: Int
    let name: String
    let image: String
    let type: String
    let description: AbilityDescription?
    
    
    struct AbilityDescription: Codable{
        let desc: String?
    }
}



struct HeroQuery: Codable {
    var heroes: [Hero]
}

extension Hero{
    static let EXAMPLE_HERO = Hero(id: 2, name: "Infernus", description: ExtendedDescription(lore: "Like most teenagers; Infernus was wild, rebellious, and impetuous.  Unlike most teenagers, Infernus was a creature from another plane and had a supernatural mastery over fire.  Needless to say:  his youth was filled with no small amount of arson, murder, and evidence disposal.  But that was then.  Now an adult, Infernus has mellowed out considerably.  He’s happy working at a bar with good live music, and talking to interesting people.  That being said when someone at the bar gets belligerent or violent, he’s not afraid to dust off the skills he once honed."), images: HeroImageSet(heroCard: "https://assets.deadlock-api.com/images/heroes/inferno.png", heroIcon: "https://assets.deadlock-api.com/images/heroes/inferno_sm.png"))
}

extension HeroQuery {
    static let EXAMPLE_QUERY = HeroQuery(heroes: [Hero.EXAMPLE_HERO])
}


extension HeroAbility {
    static let EXAMPLE_ABILITY = HeroAbility(id: 321, name: "Example", image: "https://assets.deadlock-api.com/images/heroes/inferno_sm.png", type: "Stinky", description: AbilityDescription(desc: "Gets everyone covered in stinky poopies"))
}
