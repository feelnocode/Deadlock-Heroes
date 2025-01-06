//
//  HeroAbilitiesView.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 06/01/2025.
//

//import SwiftUI
//
//struct HeroAbilitiesView: View {
//    var networkService: NetworkService
//    var body: some View {
//        VStack {
//            HStack{
//                Text("Abilities:")
//                    .padding(.leading, 26)
//                    .font(.headline)
//                Spacer()
//            }
//            
//            CustomPickerView(pickerWidth: 350, pickerHeight: 60, buttonSelection: networkService.abilitiesResult, selected: $selectedAbility)
//                .transaction { transaction in
//                    transaction.animation = .snappy
//                }
//                .shadow(radius: 5)
//            if !networkService.abilitiesResult.isEmpty{
//                VStack{
//                    ZStack{
//                        RoundedRectangle(cornerRadius: 20)
//                            .fill(.ultraThinMaterial)
//                            .shadow(radius: 5)
//                            .padding([.leading, .trailing], 21)
//                        VStack{
//                            Text(selectedAbility.name).bold()
//                                .padding(.top, 8)
//                            Text(selectedAbility.description?.desc?.stripHTML ?? "No ability descriprion")
//                                .padding([.leading, .trailing], 38)
//                                .padding(.bottom, 12)
//                        }
//                    }
//                    Spacer()
//                }
//                .transaction{transaction in
//                    transaction.animation = .interpolatingSpring(duration: 0.2)
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    HeroAbilitiesView()
//}
