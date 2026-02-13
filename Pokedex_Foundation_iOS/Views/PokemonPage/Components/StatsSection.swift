//
//  StatsSection.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//

import SwiftUI

struct StatsSection: View {
    
    @State var maxValue: Int = 0
    
    let pokeData: PokemonData
    let pokemonColor: Color
    
    var body: some View {
        Group {
            Text("Stats")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 15)
                .padding(.horizontal, 30)
            VStack {
                ForEach(pokeData.stats, id:\.stat.name) { index in
                    // reduce name for visibility
                    if index.stat.name == "special-attack"{
                        StatBar(pokeData: pokeData, statName: "Sp. Atk", statValue: index.baseStat, maxValue: maxValue, pokemonColor: pokemonColor)
                    } else if index.stat.name == "special-defense"{
                        StatBar(pokeData: pokeData, statName: "Sp. Def", statValue: index.baseStat, maxValue: maxValue, pokemonColor: pokemonColor)
                    // normal names
                    } else {
                        StatBar(pokeData: pokeData, statName: index.stat.name.capitalized, statValue: index.baseStat, maxValue: maxValue, pokemonColor: pokemonColor)
                    }
                }
            }
            .padding(.horizontal, 30)
        }
        // find stat with the highest value (reference)
        .task {
            for index in pokeData.stats {
                if index.baseStat > maxValue {
                    maxValue = index.baseStat
                }
            }
        }
    }
}

#Preview {
    PokemonView(pokemonName: "Charizard")
}
