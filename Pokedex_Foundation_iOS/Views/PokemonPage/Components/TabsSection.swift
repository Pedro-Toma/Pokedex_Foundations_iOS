//
//  TabsSection.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//

import SwiftUI

struct TabsSection: View {
    
    let pokemonColor: Color
    @Binding var selectedPage: Int
    
    var body: some View {
        HStack (spacing: 35){
            TabButton(title: "Stats", index: 0, color: pokemonColor, selectedPage: $selectedPage)
            TabButton(title: "Moves", index: 1, color: pokemonColor, selectedPage: $selectedPage)
        }
        .frame(height: 60, alignment: .bottom)
    }
}
