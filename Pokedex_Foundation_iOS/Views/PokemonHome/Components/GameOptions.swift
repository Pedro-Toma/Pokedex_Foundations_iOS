//
//  GameOptions.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 12/02/26.
//

import SwiftUI

struct GameOptions: View {
    
    let pokeList: PokemonList
    @Binding var correctPokemon: Pokemon?
    @Binding var score: Int
    @Binding var finalScore: Int
    @Binding var showResult: Bool
    @State private var pokemonPool: [Pokemon] = []
    @State private var quizOptions: [Pokemon] = []
    @AppStorage("high_score") private var highScore: Int = 0

    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            // buttons for each pokemon option
            ForEach(quizOptions) { option in
                Button(action: {
                    if let correctPokemon {
                        // correct answer
                        if option.name == correctPokemon.name {
                            finalScore = 0
                            score += 1
                            startNewRound()
                        // wrong answer
                        } else {
                            if score > highScore {
                                highScore = score
                            }
                            finalScore = score
                            score = 0
                            showResult = true
                        }
                    }
                }, label: {
                    RoundedRectangle(cornerRadius: 90)
                        .fill(LinearGradient(colors: [Color.gray, Color.white], startPoint: .top, endPoint: .bottom))
                        .stroke(Color.primary, lineWidth: 5)
                        .frame(width: 160, height: 60)
                        .overlay(
                            Text(option.name.capitalized)
                                .foregroundStyle(Color.black)
                                .font(.title3)
                                .fontWeight(.semibold)
                        )
                })
            }
        }
        // get a new pokemon
        .task {
            startNewRound()
        }
        .padding(.horizontal, 15)
        Spacer()
    }
    
    func startNewRound() {
        
        // get all pokemons
        let completeList = pokeList.results
        
        // if pool is empty, pool = all pokemons
        if pokemonPool.isEmpty {
            pokemonPool = completeList
        }
        
        //get a random index from pokemon pool
        guard let correctIndex = pokemonPool.indices.randomElement() else {
            return
        }
        
        // get correct pokemon
        let answer = pokemonPool[correctIndex]
        
        correctPokemon = answer
        
        // remove from pool
        pokemonPool.remove(at: correctIndex)
        
        // add pokemon to array of options
        var options: [Pokemon] = [answer]
        quizOptions = options
        
        // get other random pokemon names from complete list
        while options.count < 4 {
            if let randomIndex = completeList.randomElement() {
                // if is not the correct pokemon and is not already in the options list
                if randomIndex.id != answer.id && !options.contains(where: { $0.id == randomIndex.id }) {
                    // add pokemon to options list
                    options.append(randomIndex)
                }
            }
        }
        
        // shuffle options to randomize correct button placement
        quizOptions = options.shuffled()
    }
}
