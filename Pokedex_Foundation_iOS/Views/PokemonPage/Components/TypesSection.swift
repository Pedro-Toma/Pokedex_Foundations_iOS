//
//  TypesSection.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//

import SwiftUI

struct TypesSection: View {
    
    let pokeData: PokemonData
    let pokemonColor: Color
    
    var body: some View {
        VStack (spacing: 10){
            ForEach(pokeData.types, id:\.slot) { index in
                PokemonType(iconName: "\(index.type.name)Icon", type: index.type.name.capitalized, color: Color("\(index.type.name)Color"))
            }
        }
    }
}

