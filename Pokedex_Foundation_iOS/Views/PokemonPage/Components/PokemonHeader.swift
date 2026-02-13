//
//  PokemonHeader.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//


import SwiftUI

struct PokemonHeader: View {
    
    let pokemonId: Int
    let pokemonName: String
    let pokeData: PokemonData
    
    var body: some View {
        VStack {
            // pokemon id
            Text("\(String(format: "#%04d", pokemonId))")
                .font(.title)
                .foregroundStyle(Color.white)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 30)
            // pokemon image
            let imageUrlString = pokeData.sprites.other.officialArtwork.frontDefault
            let imageUrl = (URL(string: imageUrlString))
            AsyncImage(url: imageUrl, content: { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 270, height: 270, alignment: .top)
            }, placeholder : {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 270, height: 270, alignment: .top)
                    .redacted(reason: .placeholder)
                    .overlay(ProgressView())
            })
            Spacer()
        }
        // pokemon name (topTrailing)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text(pokemonName)
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)
            }
            .sharedBackgroundVisibility(.hidden)
        }
    }
}

#Preview {
    PokemonView(pokemonName: "Charizard")
}
