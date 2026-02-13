//
//  StatBar.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//


import SwiftUI

struct StatBar: View {
    
    let pokeData: PokemonData
    let statName: String
    let statValue: Int
    let maxValue: Int
    let pokemonColor: Color
    
    var body: some View {
        HStack (alignment: .bottom, spacing: 15) {
            // text info
            Text("\(statName)")
            Text("\(statValue)")
            // bar
            ZStack (alignment: .leading){
                // gray bar indicator
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 200, height: 20)
                RoundedRectangle(cornerRadius: 20)
                    // whole gradient bar
                    .fill(
                        LinearGradient(
                            colors: [Color("\(pokeData.types.first!.type.name)DarkColor"), Color("\(pokeData.types.first!.type.name)Color")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 200, height: 20)
                    // align selected part to the leading edge
                    .mask(
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: CGFloat(statValue)/CGFloat(maxValue)*200, height: 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    )
            }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

#Preview {
    PokemonView(pokemonName: "Caterpie")
}

