//
//  PokeHome.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 12/02/26.
//

import SwiftUI

struct PokeHome: View {
    
    @State var pokeList: PokemonList?
    @State var correctPokemon: Pokemon?
    @State var score: Int = 0
    @State var finalScore: Int = 0
    @State var showResult: Bool = false
    @AppStorage("high_score") private var highScore: Int = 0
    
    var body: some View {
        TabView {
            // pokedex tab
            Tab ("Home", systemImage: "house.fill") {
                if let pokeList {
                    Pokedex(pokeList: pokeList)
                } else {
                    ProgressView()
                }
            }
            // game tab (who`s that pokemon?)
            Tab ("Game", systemImage: "gamecontroller.fill") {
                VStack {
                    VStack {
                        if let correctPokemon {
                            // title, frame and image
                            PokemonHiddenSection(pokemonName: correctPokemon.name)
                                .id(correctPokemon.id)
                        } else {
                            // placeholder
                            Circle()
                                .frame(width: 200, height: 200)
                                .redacted(reason: .placeholder)
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, minHeight: 400)
                    .background(
                        VStack (spacing: 35){
                            GameBackground()
                            GameScore(highScore: highScore, score: score)
                            if let pokeList {
                                GameOptions(pokeList: pokeList, correctPokemon: $correctPokemon, score: $score, finalScore: $finalScore, showResult: $showResult)
                            } else {
                                ProgressView()
                            }
                            Spacer()
                        }
                        .ignoresSafeArea(.all)
                    )
                }
                // game results
                .overlay(
                    EndGame(showResult: $showResult, finalScore: finalScore)
                )
            }
        }
        .accentColor(.red)
        // fetch pokemon list
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
    PokeHome()
}
