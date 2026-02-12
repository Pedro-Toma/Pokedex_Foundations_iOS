//
//  PokeHome.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 12/02/26.
//

import SwiftUI

struct PokeHome: View {
    
    @State private var pokeList: PokemonList?
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        TabView {
            Tab ("Home", systemImage: "house.fill") {
                NavigationStack {
                    if let pokeList {
                        ScrollView {
                            LazyVGrid (columns: columns, spacing: 26){
                                ForEach(pokeList.results) { pokemon in
                                    NavigationLink(destination : {
                                        PokemonView(pokemonName: pokemon.name)
                                    }, label: {
                                        PokemonCard(name: pokemon.name.capitalized, id: pokemon.id, url: pokemon.url)
                                    })
                                    .accentColor(Color.primary)
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                        .navigationTitle("Pokédex")
                    } else {
                        ProgressView()
                    }
                }
            }
            Tab ("Game", systemImage: "gamecontroller.fill") {
                Text("Game")
            }
        }
        .accentColor(.red)
        .task {
            do {
                let fetched = try await PokeAPI.getPokemons()
                pokeList = PokemonList(results: fetched)
            } catch {
                print("Erro ao buscar pokemons", error.localizedDescription)
            }
        }
    }}

#Preview {
    PokeHome()
}
