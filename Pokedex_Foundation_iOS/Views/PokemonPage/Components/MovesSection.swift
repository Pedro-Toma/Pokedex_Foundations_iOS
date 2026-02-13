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
            // list of all moves from a specific pokemon
            List {
                ForEach(pokeData.moves, id:\.move.url) { moveIndex in
                    
                    // get level which the pokemon learned the move
                    // from the first game version in the list
                    let level = moveIndex.versionGroupDetails.first?.levelLearnedAt ?? 0
                    // get move url for more information
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
        }
    }
}

#Preview {
    PokemonView(pokemonName: "Charizard")
}
