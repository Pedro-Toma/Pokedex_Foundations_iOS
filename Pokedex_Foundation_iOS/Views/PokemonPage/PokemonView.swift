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
                        // background
                        let pokemonColor = pokeData.types.first != nil ?
                                Color("\(pokeData.types.first!.type.name)Color") :
                                Color.primary
                        pokemonColor.ignoresSafeArea(.all)
                        
                        // infoCard
                        // pokemon stats information
                        InfoCard(pokeData: pokeData, pokemonColor: pokemonColor, selectedPage: $selectedPage)
                        
                        // header
                        PokemonHeader(pokemonId: pokeData.id, pokemonName: pokeData.name.capitalized, pokeData: pokeData)
                    }
                }
            } else {
                ProgressView()
            }
        }
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
