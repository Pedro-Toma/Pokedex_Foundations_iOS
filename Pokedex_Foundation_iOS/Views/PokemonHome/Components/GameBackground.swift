//
//  GameBackground.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 12/02/26.
//

import SwiftUI

struct GameBackground: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack (alignment: .bottom) {
            VStack {
                Rectangle()
                    .fill(colorScheme == .light ? .red : .black)
                    .frame(maxWidth: .infinity, maxHeight: 500)
            }
            Rectangle()
                .fill(colorScheme == .light ? .black : .white)
                .frame(maxWidth: .infinity, maxHeight: 30)
                .offset(y: 20)
            Circle()
                .fill(colorScheme == .light ? .black : .white)
                .frame(width: 100, height: 100)
                .offset(y: 50)
            Circle()
                .fill(colorScheme == .light ? .white : .black)
                .frame(width: 66, height: 66)
                .offset(y: 33)
        }
    }
}

#Preview {
    GameBackground()
}
