//
//  PokemonType.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//


import SwiftUI

struct PokemonType: View {
    
    let iconName: String
    let type: String
    let color: Color
    
    var body: some View {
        HStack {
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
            Spacer()
            Text("\(type)")
                .font(.subheadline)
            Spacer()
        }
        .foregroundColor(Color.white)
        .padding(8)
        .frame(width: 110, height: 25)
        .background(color)
        .cornerRadius(8)
    }
}

#Preview {
    PokemonType(iconName: "fireIcon", type: "fire", color: .blue)
}
