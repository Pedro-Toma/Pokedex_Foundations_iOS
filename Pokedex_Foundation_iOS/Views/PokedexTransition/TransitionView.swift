//
//  TransitionView.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 12/02/26.
//

import SwiftUI

struct TransitionView: View {
    
    @State var showHomePage: Bool = false
    @State var isActive: Bool = false
    @State var buttonColor: Color = .white
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        GeometryReader { reader in
            // wait for signal (showHomePage) to go to the home page
            if showHomePage {
                PokeHome()
                    .transition(.opacity)
            } else {
                VStack {
                    ZStack (alignment: .bottom) {
                        IntroText(isActive: $isActive)
                        PokeballButton(buttonColor: $buttonColor, isActive: $isActive, showHomePage: $showHomePage)
                    }
                    Spacer()
                }
                .ignoresSafeArea(.all)
                // red - half of the screen
                .frame(maxWidth: .infinity, maxHeight: reader.size.height*0.5)
                // if button was pressed, red part and button slide to the top of the screen
                .offset(y: isActive ? -reader.size.height * 0.7 : 0)
                // change button color based on color scheme when screen loads
                .onAppear {
                    buttonColor = (colorScheme == .light ? .white : .black)
                }
                // change button color based on color scheme if user changes color scheme
                .onChange (of: colorScheme) {
                    buttonColor = (colorScheme == .light ? .white : .black)
                }
            }
        }
    }
}

#Preview {
    TransitionView()
}
