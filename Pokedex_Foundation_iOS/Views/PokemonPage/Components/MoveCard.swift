//
//  MoveCard.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//

import SwiftUI

struct MoveCard: View {
    
    let levelLearnedAt: Int
    let url: String
    @State var moveData: MoveData?
    
    var body: some View {
        Group {
            if let moveData {
                VStack (spacing: 10) {
                    HStack {
                        Text(moveData.name.capitalized)
                            .font(.title2)
                            .fontWeight(.bold)
                        Image("\(moveData.type.name)Icon")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(.primary)
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                        Spacer()
                        Text(moveData.damageClass.name.capitalized)
                    }
                    HStack {
                        VStack (alignment: .leading){
                            Text("Lv. \(levelLearnedAt)")
                            if let acc = moveData.accuracy {
                                Text("ACC: \(acc)%")
                            } else {
                                Text("ACC: -")
                            }
                        }
                        Spacer()
                        VStack (alignment: .leading) {
                            HStack {
                                Text("Power ")
                                if let pow = moveData.power {
                                    Text("\(pow)")
                                } else {
                                    Text("-")
                                }
                            }
                            Text("PP:\(moveData.pp)/\(moveData.pp)")
                        }
                    }
                }
                .font(.title3)
                .foregroundStyle(.primary)
                .fontWeight(.semibold)
                .padding(10)
                .padding(.leading, 10)
                .frame(maxWidth: .infinity)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("\(moveData.type.name)Color").opacity(0.2))
                            .stroke(Color("\(moveData.type.name)Color"), lineWidth: 2)
                        HStack {
                            Rectangle()
                                .fill(Color("\(moveData.type.name)Color"))
                                .frame(width: 10)
                            Spacer()
                        }
                    }
                )
                .cornerRadius(10)
            }
            else {
                ProgressView()
            }
        }
        //.frame(maxWidth: .infinity, alignment: .leading)
        .task {
            do {
                let fetched = try await PokeAPI.getMoveData(url: url)
                moveData = fetched
            } catch {
                print("Erro ao buscar move", error.localizedDescription)
            }
        }
    }
    
}

#Preview {
    MoveCard(levelLearnedAt: 36, url: "https://pokeapi.co/api/v2/move/7/")
}
