//
//  ContentView.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 07/02/26.
//

import SwiftUI

struct PokemonStatsView: View {
    
    // MARK: PROPERTIES
    
    let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png")
    
    @State var selectedPage: Int = 0
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: BODY
    
    var body: some View {
        
        NavigationStack{
            ZStack {
                // background
                Color.orange.ignoresSafeArea(.all)
                
                // pokemon stats information
                infoCard
                
                // header
                PokemonHeader(pokemonId: 6, pokemonName: "Charizard", pokemonImage: url)
            }
        }
    }
    
    // MARK: PAGE SECTIONS (VAR)
    
    private var infoCard: some View {
        VStack {
            Spacer()
            VStack (alignment: .center){
                tabsSection
                typesSection
                statsSection
                measurementsSection
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
    
    private var tabsSection: some View {
        HStack (spacing: 35){
            TabButton(title: "Stats", index: 0, color: Color.orange, selectedPage: $selectedPage)
            TabButton(title: "Moves", index: 1, color: Color.orange, selectedPage: $selectedPage)
        }
        .frame(height: 60, alignment: .bottom)
    }
    
    private var typesSection: some View {
        HStack (spacing: 12){
            PokemonType(iconName: "house.fill", type: "Fire", color: Color.orange)
            PokemonType(iconName: "house.fill", type: "Flying", color: Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)))
        }
    }
    
    private var statsSection: some View {
        Group {
            Text("Stats")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 15)
                .padding(.horizontal, 30)
            VStack {
                StatBar(statName: "HP", statValue: 78)
                StatBar(statName: "Attack", statValue: 85)
                StatBar(statName: "Defense", statValue: 78)
                StatBar(statName: "Sp. Atk", statValue: 109)
                StatBar(statName: "Sp. Def", statValue: 85)
                StatBar(statName: "Speed", statValue: 100)
            }
            .padding(.horizontal, 30)
        }
    }
    
    private var measurementsSection: some View {
        HStack (spacing: 40) {
            MeasurementAttributes(type: .weight, value: 90.5)
            MeasurementAttributes(type: .height, value: 1.7)
        }
        .padding(.vertical, 30)
    }
}

// MARK: COMPONENTS (STRUCT)

private struct PokemonHeader: View {
    
    let pokemonId: Int
    let pokemonName: String
    let pokemonImage: URL?
    
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
                    .frame(width: 300, height: 300, alignment: .top)
            }, placeholder : {
                ProgressView()
            })
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "arrow.left")
                    .font(.title)
                    .foregroundStyle(Color.white)
                    .padding(.leading, 10)
                    .padding(.vertical, 100)
            }
            .sharedBackgroundVisibility(.hidden)
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

private struct TabButton: View {
    
    let title: String
    let index: Int
    let color: Color
    @Binding var selectedPage: Int
    
    var body: some View {
        let isActive = (selectedPage == index)
        
        VStack(spacing: 4) {
            Text(title)
                .foregroundColor(isActive ? .primary : .secondary)
                .fontWeight(isActive ? .bold : .regular)
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
                .frame(width: 70, height: 2)
                .opacity(isActive ? 1 : 0)
        }
        .font(.headline)
    }
}

private struct PokemonType: View {
    
    let iconName: String
    let type: String
    let color: Color
    
    var body: some View {
        HStack {
            Image(systemName: "\(iconName)")
                .font(.caption)
            Spacer()
            Text("\(type)")
                .font(.subheadline)
            Spacer()
        }
        .foregroundColor(Color.white)
        .padding(8)
        .frame(width: 90, height: 25)
        .background(color)
        .cornerRadius(8)
    }
    
}

private struct StatBar: View {
    
    let statName: String
    let statValue: Int
    
    var body: some View {
        HStack (alignment: .bottom, spacing: 15) {
            Text("\(statName)")
            Text("\(statValue)")
            ZStack (alignment: .leading){
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 200, height: 20)
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            colors: [Color(#colorLiteral(red: 0.5652058125, green: 0.313066721, blue: 0.1052093282, alpha: 1)), Color.orange],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 200, height: 20)
                    .mask(
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: CGFloat(statValue), height: 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    )
            }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct MeasurementAttributes: View {
    
    let type: MeasurementType
    let value: CGFloat
    
    var body: some View {
        HStack {
            Image(systemName: "\(type.icon)")
                .foregroundColor(Color.primary)
                .font(.title2)
            Text("\(String(format: "%.1f", value)) \(type.unit)")
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    PokemonStatsView()
}
