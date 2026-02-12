//
//  TabButton.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//

import SwiftUI

struct TabButton: View {
    
    let title: String
    let index: Int
    let color: Color
    @Binding var selectedPage: Int
    
    var body: some View {
        let isActive = (selectedPage == index)
        VStack(spacing: 4) {
            Text(title)
                .foregroundColor(isActive ? .primary : .secondary)
                .fontWeight(isActive ? .semibold : .regular)
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
                .frame(width: 70, height: 2)
                .opacity(isActive ? 1 : 0)
        }
        .font(.headline)
        .onTapGesture {
            selectedPage = index
        }
    }
}
