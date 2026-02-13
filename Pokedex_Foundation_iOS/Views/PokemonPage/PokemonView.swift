//
//  ContentView.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 07/02/26.
//

import SwiftUI

struct PokemonView: View {
    
    // MARK: PROPERTIES
    
    let pokemonName: String
    @State private var pokeData: PokemonData?
    @State var selectedPage: Int = 0
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: BODY
    
    var body: some View {
        
        Group {
            if let pokeData {
                NavigationStack{
                    ZStack {
                        // background color
                        let pokemonColor = pokeData.types.first != nil ?
                                Color("\(pokeData.types.first!.type.name)Color") :
                                Color.primary
                        pokemonColor.ignoresSafeArea(.all)
                        
                        // pokemon stats information
                        InfoCard(pokeData: pokeData, pokemonColor: pokemonColor, selectedPage: $selectedPage)
                        
                        // name, id and image
                        PokemonHeader(pokemonId: pokeData.id, pokemonName: pokeData.name.capitalized, pokeData: pokeData)
                    }
                }
            } else {
                // placeholder
                VStack{
                    Spacer()
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color.gray.opacity(0.3))
                        .frame(maxWidth: .infinity, maxHeight: 480)
                        .overlay(ProgressView())
                }
                .ignoresSafeArea(.all)
                .background(
                    Color.gray.opacity(0.2).ignoresSafeArea(.all)
                )
            }
        }
        // fetch specific pokemon data
        .task {
            do {
                let fetched = try await PokeAPI.getPokemonData(name: pokemonName)
                pokeData = fetched
            } catch {
                print("Erro ao buscar pokemons", error.localizedDescription)
            }
        }
    }
}

#Preview {
    PokemonView(pokemonName: "Charizard")
}
