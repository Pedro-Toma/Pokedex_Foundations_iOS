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
                let pokemonColor = pokeData.types.first != nil ?
                        Color("\(pokeData.types.first!.type.name)Color") :
                        Color.primary
                VStack (spacing: 0){
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
                    AsyncImage(url: imageUrl, content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130, alignment: .top)
                    }, placeholder : {
                        ProgressView()
                    })
                }
                .padding(18)
                .frame(width: 180, height: 200)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(pokemonColor)
                        .stroke(Color.white.opacity(0.5), lineWidth: 8)
                )
            } else {
                ProgressView()
            }
        }
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
