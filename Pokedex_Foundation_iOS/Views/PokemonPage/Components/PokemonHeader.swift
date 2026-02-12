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
            Text("\(String(format: "#%04d", pokemonId))")
                .font(.title)
                .foregroundStyle(Color.white)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 30)
            
            AsyncImage(url: pokemonImage, content: { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 270, height: 270, alignment: .top)
            }, placeholder : {
                ProgressView()
            })
            Spacer()
        }
        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Image(systemName: "arrow.left")
//                    .font(.title)
//                    .foregroundStyle(Color.white)
//                    .padding(.leading, 10)
//                    .padding(.vertical, 100)
//            }
//            .sharedBackgroundVisibility(.hidden)
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
    
    private var pokemonImage: URL? {
        URL(string: pokeData.sprites.other.officialArtwork.frontDefault)
    }
}

#Preview {
    PokemonView(pokemonName: "Charizard")
}
