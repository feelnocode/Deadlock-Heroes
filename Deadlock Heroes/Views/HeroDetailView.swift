//
//  HeroDetailView.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 01/01/2025.
//

import SwiftUI

struct HeroDetailView: View {
    let hero: Hero
    let networkService: NetworkService
    @State private var selectedAbility = HeroAbility.EXAMPLE_ABILITY
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    ZStack(alignment: .bottom){
                        if let imageUrl = hero.images.heroCard {
                            CacheImage(url: URL(string: imageUrl))
                                .frame(width: 350, height: 350)
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 5)
                                .padding()
                        }else{
                            Image("No_Image_Available")
                                .resizable()
                                .frame(width: 350, height: 350)
                                .clipShape(.rect(cornerRadius: 10))
                                .padding()
                        }
                    }
                    VStack {
                        HStack{
                            Text("Abilities:")
                                .padding(.leading, 26)
                                .font(.headline)
                            Spacer()
                        }
                        
                        CustomPickerView(pickerWidth: 350, pickerHeight: 60, buttonSelection: networkService.abilitiesResult, selected: $selectedAbility)
                            .transaction { transaction in
                                transaction.animation = .snappy
                            }
                            .shadow(radius: 5)
                        if !networkService.abilitiesResult.isEmpty{
                            VStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.ultraThinMaterial)
                                        .shadow(radius: 5)
                                        .padding([.leading, .trailing], 21)
                                    VStack{
                                        Text(selectedAbility.name).bold()
                                            .padding(.top, 8)
                                        Text(selectedAbility.description?.desc?.stripHTML ?? "No ability descriprion")
                                            .padding([.leading, .trailing], 38)
                                            .padding(.bottom, 12)
                                    }
                                }
                                Spacer()
                            }
                            .transaction{transaction in
                                transaction.animation = .interpolatingSpring(duration: 0.2)
                            }
                        }
                    }
                    
                    VStack {
                        HStack{
                            Text("Description:")
                                .padding(.leading, 26)
                                .font(.headline)
                            Spacer()
                        }
                    }
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.ultraThinMaterial)
                                .shadow(radius: 10)
                                .padding([.leading, .trailing], 21)
                                .padding(.top, 5)
                            Text(hero.description.lore ?? "Sorry, no lore added yet")
                                .padding([.leading, .trailing], 38)
                                .padding(.top, 12)
                                .padding(.bottom, 7)
                        }
                        Spacer()
                    }
                }
                .background(
                    CacheImage(url: URL(string: hero.images.heroCard ?? "https://cdn.shopify.com/s/files/1/0533/2089/files/placeholder-images-image_large.png?v=1530129081"))
                        .frame(width: 1000, height: 1800)
                        .brightness(0.4)
                        .blur(radius: 50)
                )
            }
            .navigationTitle(hero.name)
            .toolbarBackground(.ultraThinMaterial)
            .task {
                do{
                    try await networkService.fetchAbilities(hero.id)
                    if networkService.abilitiesResult.first != nil {
                        selectedAbility = networkService.abilitiesResult.first!
                    }
                }catch{print(error)}
            }
        }
    }
}

#Preview {
    HeroDetailView(hero: Hero.EXAMPLE_HERO, networkService: NetworkService())
}
