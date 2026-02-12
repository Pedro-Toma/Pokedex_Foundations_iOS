//
//  MeasurementAttributes.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//


import SwiftUI

struct MeasurementAttributes: View {
    
    let type: MeasurementType
    let value: CGFloat
    
    var body: some View {
        HStack {
            Image(systemName: "\(type.icon)")
                .foregroundColor(Color.primary)
                .font(.headline)
            Text("\(String(format: "%.1f", value)) \(type.unit)")
                .font(.headline)
                .fontWeight(.regular)
        }
    }
}

#Preview {
    PokemonView(pokemonName: "Charizard")
}
