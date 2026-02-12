//
//  PokeListView.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//

import SwiftUI

struct PokeListView: View {
    
    @State private var pokeList: PokemonList?
    
    var body: some View {
        NavigationStack {
            if let pokeList {
                List {
                    ForEach(pokeList.results) { pokemon in
                        NavigationLink(destination : {
                            PokemonView(pokemonName: pokemon.name)
                        }, label: {
                            Text(pokemon.name.capitalized)
                        })
                    }
                }
            } else {
                ProgressView()
            }
        }
        .task {
            do {
                let fetched = try await PokeAPI.getPokemons()
                pokeList = PokemonList(results: fetched)
            } catch {
                print("Erro ao buscar pokemons", error.localizedDescription)
            }
        }
    }
}

#Preview {
    PokeListView()
}
