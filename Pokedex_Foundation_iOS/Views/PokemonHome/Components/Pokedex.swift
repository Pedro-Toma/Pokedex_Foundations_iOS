//
//  Pokedex.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 12/02/26.
//

import SwiftUI

struct Pokedex: View {
    
    @State private var searchText: String = ""
    var pokeList: PokemonList
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var filteredPokemon: [Pokemon]{
        
        // get all pokemons
        let results = pokeList.results
        
        // return list with filter (case insensitive)
        if searchText.isEmpty {
            return results
        } else {
            return results.filter { pokemon in
                pokemon.name.localizedStandardContains(searchText)
            }
        }
    }
    
    var body: some View {
        // list with all pokemons with filter
        NavigationStack {
           ScrollView {
               LazyVGrid (columns: columns, spacing: 16){
                   ForEach(filteredPokemon) { pokemon in
                       NavigationLink(destination : {
                           PokemonView(pokemonName: pokemon.name)
                       }, label: {
                           PokemonCard(name: pokemon.name)
                       })
                       .accentColor(Color.primary)
                   }
               }
               .padding(.horizontal, 10)
           }
           .navigationTitle("Pokédex")
           .searchable(text: $searchText, prompt: "Search")
       }
    }
}
