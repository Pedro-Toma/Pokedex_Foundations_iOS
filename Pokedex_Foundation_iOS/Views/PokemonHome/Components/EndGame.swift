//
//  EndGame.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 13/02/26.
//

import SwiftUI

struct EndGame: View {
    
    @Binding var showResult: Bool
    let finalScore: Int
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        if showResult {
            Color.white.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Final Score: \(finalScore)")
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 15)
                Spacer()
                // reset game
                Button {
                    showResult = false
                } label: {
                    Text("Jogar Novamente")
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.black)
                        )
                }
            }
            .frame(width: 200, height: 100)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .stroke(Color.black, lineWidth: 5)
            }
        }
    }
}
