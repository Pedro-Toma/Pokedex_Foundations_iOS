//
//  PokemonHiddenSection.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 12/02/26.
//

import SwiftUI

struct PokemonHiddenSection: View {
    
    @State private var pokeData: PokemonData?
    let pokemonName: String
    
    var body: some View {
        Group {
            VStack {
                Text("Who`s That Pokemon?")
                    .font(.title)
                    .fontWeight(.heavy)
                ZStack {
                    // pokemon frame
                    RoundedRectangle(cornerRadius: 180)
                        .fill(Color.black)
                        .frame(maxWidth: 320, maxHeight: 320)
                    if let pokeData {
                        let imageUrlString = pokeData.sprites.other.officialArtwork.frontDefault
                        let imageUrl = (URL(string: imageUrlString))
                        // pokemon image (fill white)
                        AsyncImage(url: imageUrl, content: { image in
                            image
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.white)
                                .frame(width: 250, height: 250, alignment: .top)
                            
                        }, placeholder : {
                            Circle()
                                .fill(Color.white.opacity(0.5))
                                .frame(width: 250, height: 250, alignment: .top)
                                .redacted(reason: .placeholder)
                                .overlay(ProgressView())
                        })
                    } else {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 300, height: 300, alignment: .top)
                            .redacted(reason: .placeholder)
                            .overlay(ProgressView())
                    }
                    
                }
            }
        }
        // fetch specific pokemon data
        .task {
            do {
                let fetched = try await PokeAPI.getPokemonData(name: pokemonName)
                withAnimation(.easeInOut(duration: 0.8)) {
                    pokeData = fetched
                }
            } catch {
                print("Erro ao buscar pokemons", error.localizedDescription)
            }
        }
    }
}

#Preview {
    PokemonHiddenSection(pokemonName: "charizard")
}
