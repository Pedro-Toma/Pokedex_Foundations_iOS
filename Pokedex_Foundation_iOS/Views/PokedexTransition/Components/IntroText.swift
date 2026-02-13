//
//  IntroText.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 13/02/26.
//

import SwiftUI

struct IntroText: View {
    
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(.red)
                .overlay(
                    VStack {
                        Spacer()
                        Text("Open")
                            .font(.title)
                            .fontWeight(.bold)
                            .opacity(isActive ? 0 : 1)
                        Text("Pokedex")
                            .font(.title)
                            .fontWeight(.bold)
                            .opacity(isActive ? 0 : 1)
                        Image(systemName: "arrow.down")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .opacity(isActive ? 0 : 1)
                    }
                        .padding(.bottom, 60)
                )
        }
    }
}
