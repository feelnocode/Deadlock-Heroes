//
//  HeroDetailView.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 01/01/2025.
//

import SwiftUI

struct HeroDetailView: View {
    let hero: Hero
    var viewModel = HeroDetailViewModel()
    @State private var selectedAbility = HeroAbility.EXAMPLE_ABILITY
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    HeroCardImageComponent(imageUrl: hero.images.heroCard)
                    VStack {
                        HStack{
                            Text("Abilities:")
                                .padding(.leading, 26)
                                .font(.headline)
                            Spacer()
                        }
                        
                        CustomPickerView(pickerWidth: 350, pickerHeight: 60, buttonSelection: viewModel.abilities, selected: $selectedAbility)
                            .transaction { transaction in
                                transaction.animation = .snappy
                            }
                            .shadow(radius: 5)
                        if !viewModel.abilities.isEmpty{
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
                    try await viewModel.getAbilities(hero.id)
                    if viewModel.abilities.first != nil {
                        selectedAbility = viewModel.abilities.first!
                    }
                }catch{print(error)}
            }
        }
    }
}

#Preview {
    HeroDetailView(hero: Hero.EXAMPLE_HERO)
}
