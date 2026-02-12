//
//  MovesSection.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//

import SwiftUI

struct MovesSection: View {
    
    let pokeData: PokemonData
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Moves")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 15)
                .padding(.horizontal, 30)
            List {
                ForEach(pokeData.moves, id:\.move.url) { moveIndex in
                    
                    let level = moveIndex.versionGroupDetails.first?.levelLearnedAt ?? 0
                    let url = moveIndex.move.url
                    
                    MoveCard(
                        levelLearnedAt: level,
                        url: url
                    )
                    .listRowSeparator(.hidden)
                }
            }
            .padding(.horizontal, 10)
            .listStyle(.plain)
            .background(
                Color.white
            )
        }
    }
}

#Preview {
    PokemonView(pokemonName: "Charizard")
}
