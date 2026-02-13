//
//  PokeballButton.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 13/02/26.
//

import SwiftUI

struct PokeballButton: View {
    
    @Binding var buttonColor: Color
    @Binding var isActive: Bool
    @Binding var showHomePage: Bool
    
    var body: some View {
        Rectangle()
            .fill(Color.black)
            .frame(maxWidth: .infinity, maxHeight: 30)
            .offset(y: 20)
        Circle()
            .fill(Color.primary)
            .frame(width: 100, height: 100)
            .offset(y: 50)
        Button {
            abrirPokedex()
        } label: {
            Circle()
                .fill(buttonColor)
                .frame(width: 66, height: 66)
                .offset(y: 33)
        }
    }
    
    func abrirPokedex() {
        
        // button color animation
        withAnimation(.easeInOut(duration: 0.5)) {
            buttonColor = Color.cyan
        }
        
        // spring animation for text opacity and rectangle + button slide
        withAnimation(.spring(response: 2, dampingFraction: 0.8)) {
            isActive = true
        }
        
        // wait for the animation to finish (1 second delay)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                showHomePage = true
            }
        }
    }
}
