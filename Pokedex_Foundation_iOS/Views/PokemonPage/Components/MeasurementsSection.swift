//
//  MeasurementsSection.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//

import SwiftUI

struct MeasurementsSection: View {
    
    let pokeData: PokemonData
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            MeasurementAttributes(type: .weight, value: CGFloat(pokeData.weight)/10)
            MeasurementAttributes(type: .height, value: CGFloat(pokeData.height)/10)
        }
    }
}

#Preview {
    PokemonView(pokemonName: "Charizard")
}
