//
//  CustomPickerView.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 04/01/2025.
//

import SwiftUI

struct CustomPickerView: View {
    var pickerWidth: CGFloat
    var pickerHeight: CGFloat
    let buttonSelection: [HeroAbility]
    @Binding var selected: HeroAbility
    var body: some View {
        ZStack {
            HStack(alignment: .center){
                if buttonSelection.count > 0 {
                    HStack(spacing: 40){
                        ForEach(buttonSelection){button in
                            Button {
                                withAnimation {
                                    selected = button
                                }
                            } label: {
                                CacheImage(url: URL(string: button.image))
                                    .frame(width: selected.name == button.name ? 50 : 40, height: selected.name == button.name ? 50 : 40)
                                    .background(.ultraThinMaterial)
                                    .clipShape(.buttonBorder)
                                    .shadow(radius: 1)
                            }
                        }
                    }
                }else{Text("No abilities available").foregroundStyle(.secondary)}
            }
            .frame(width: pickerWidth, height: pickerHeight)
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 10))
        }
    }
}

