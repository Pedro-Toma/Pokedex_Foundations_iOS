//
//  InfoCard.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//

import SwiftUI

struct InfoCard: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let pokeData: PokemonData
    let pokemonColor: Color
    @Binding var selectedPage: Int

    var body: some View {
        VStack {
            Spacer()
            VStack (alignment: .center){
                TabsSection(pokemonColor: pokemonColor, selectedPage: $selectedPage)
                TabView (selection: $selectedPage){
                    VStack (alignment: .center) {
                        HStack (spacing: 60){
                            TypesSection(pokeData: pokeData, pokemonColor: pokemonColor)
                            MeasurementsSection(pokeData: pokeData)
                        }
                        StatsSection(pokeData: pokeData, pokemonColor: pokemonColor)
                    }
                    .tag(0)
                    VStack (alignment: .center) {
                        MovesSection(pokeData: pokeData)
                    }
                    .tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 480)
            .background(colorScheme == .light ? Color.white : Color.black)
            .cornerRadius(40)
            .shadow(
                color: Color.primary,
                radius: 10,
                y: 8
            )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    PokemonView(pokemonName: "Charizard")
    
}

//#Preview {
//    TabView {
//        Tab ("qualquer coisa", systemImage: "cat"){
//            RoundedRectangle(cornerRadius: 12)
//                .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
//                .padding()
//        }
//        
//        Tab ("qualquer cois", systemImage: "dog"){
//            Color.blue
//                .ignoresSafeArea()
//        }
//    }
//}
