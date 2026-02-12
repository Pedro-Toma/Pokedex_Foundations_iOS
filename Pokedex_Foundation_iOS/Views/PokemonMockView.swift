//
//  PokemonMockView.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//

import SwiftUI

struct PokemonMockView: View {
    
    let pokemonName: String
    @State private var pokeData: PokemonData?
    
    var body: some View {
        Group {
            if let pokeData {
                Text("\(pokeData.id)")
                ForEach(pokeData.types, id:\.type.name ) { index in
                    Text(index.type.name)
                }
                AsyncImage(url: pokemonImage, content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300, alignment: .top)
                }, placeholder : {
                    ProgressView()
                })
                ForEach(pokeData.stats, id:\.stat.name) { index in
                    HStack {
                        Text(index.stat.name)
                        Text("\(index.baseStat)")
                    }
                }
                
                Text("\(pokeData.weight)")
                Text("\(pokeData.height)")
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
    
    var pokemonImage: URL? {
        guard let url = pokeData?.sprites.other.officialArtwork.frontDefault else {
            print("OI")
            return nil
        }
        return URL(string: url)
    }
    
}

#Preview {
    PokemonMockView(pokemonName: "charizard")
}
