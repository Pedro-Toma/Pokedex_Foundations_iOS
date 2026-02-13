//
//  PokemonCard.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 12/02/26.
//

import SwiftUI

struct PokemonCard: View {
    
    let name: String
    let id: String
    let url: String
    
    @State private var pokeData: PokemonData?
    
    var body: some View {
        Group {
            if let pokeData {
                // pokemon background color - first type
                let pokemonColor = pokeData.types.first != nil ?
                Color("\(pokeData.types.first!.type.name)Color") :
                Color.primary
                VStack (spacing: 0){
                    // name and id
                    VStack (alignment: .leading, spacing: 0) {
                        Text(name)
                            .font(.headline)
                        Text("\(String(format: "#%04d", Int(id) ?? 0))")
                            .font(.subheadline)
                            .fontWeight(.light)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    let imageUrlString = pokeData.sprites.other.officialArtwork.frontDefault
                    let imageUrl = (URL(string: imageUrlString))
                    // image
                    AsyncImage(url: imageUrl, content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130, alignment: .top)
                    }, placeholder : {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 130, height: 130, alignment: .top)
                            .redacted(reason: .placeholder)
                            .overlay(ProgressView())
                    })
                }
                // card frame
                .padding(18)
                .frame(width: 180, height: 200)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(pokemonColor)
                        .stroke(Color.white.opacity(0.5), lineWidth: 8)
                )
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 180, height: 200)
                    .redacted(reason: .placeholder)
                    .overlay(ProgressView())
            }
        }
        // fetch specific pokemon data
        .task {
            do {
                let fetched = try await PokeAPI.getPokemonData(name: name)
                pokeData = fetched
            } catch {
                print("Erro ao buscar pokemons", error.localizedDescription)
            }
        }
    }
}

#Preview {
    PokemonCard(name: "Charizard", id: "6", url: "https://pokeapi.co/api/v2/pokemon/charizard")
}
