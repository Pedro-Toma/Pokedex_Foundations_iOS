//
//  GameScore.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 12/02/26.
//

import SwiftUI

struct GameScore: View {
    
    let highScore: Int
    let score: Int
    
    var body: some View {
        HStack {
            Text("High Score: \(highScore)")
                .foregroundColor(Color.white)
                .padding(.vertical, 4)
                .padding(.horizontal, 18)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                )
            Spacer()
            Text("Score: \(score)")
                .foregroundColor(Color.white)
                .padding(.vertical, 4)
                .padding(.horizontal, 18)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                )
        }
        .fontWeight(.semibold)
        .padding(.trailing, 30)
        .padding(.leading, 12)
    }
}

#Preview {
    GameScore(highScore: 10, score: 0)
}
