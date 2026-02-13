//
//  GameBackground.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 12/02/26.
//

import SwiftUI

struct GameBackground: View {
    var body: some View {
        ZStack (alignment: .bottom) {
            VStack {
                Rectangle()
                    .fill(.red)
                    .frame(maxWidth: .infinity, maxHeight: 500)
            }
            Rectangle()
                .fill(Color.black)
                .frame(maxWidth: .infinity, maxHeight: 30)
                .offset(y: 20)
            Circle()
                .fill(Color.primary)
                .frame(width: 100, height: 100)
                .offset(y: 50)
            Circle()
                .fill(Color.white)
                .frame(width: 66, height: 66)
                .offset(y: 33)
        }
    }
}

#Preview {
    GameBackground()
}
