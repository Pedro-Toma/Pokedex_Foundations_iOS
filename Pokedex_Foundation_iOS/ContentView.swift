//
//  ContentView.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 07/02/26.
//

import SwiftUI

struct ContentView: View {
    
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
                
                // foreground
                VStack {
                    Spacer()
                    VStack (alignment: .center){
                        HStack (spacing: 35){
                            VStack (spacing: 4){
                                Text("Stats")                             .foregroundColor(Color.primary)
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.orange)
                                    .frame(width: 70, height: 2)
                                    .opacity(selectedPage == 0 ? 1 : 0)
                            }
                            VStack (spacing: 4){
                                Text("Moves")
                                    .foregroundColor(Color.secondary)
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.orange)
                                    .frame(width: 70, height: 2)
                                    .opacity(selectedPage == 0 ? 0 : 1)
                            }
                        }
                        .font(.headline)
                        .frame(height: 60, alignment: .bottom)
                        HStack (spacing: 12){
                            HStack {
                                Image(systemName: "house.fill")
                                    .font(.caption)
                                Spacer()
                                Text("Fire")
                                    .font(.subheadline)
                                Spacer()
                            }
                            .foregroundColor(Color.white)
                            .padding(8)
                            .frame(width: 90, height: 25)
                            .background(Color.orange)
                            .cornerRadius(8)
                            HStack {
                                Image(systemName: "house.fill")
                                    .font(.caption)
                                Spacer()
                                Text("Flying")
                                    .font(.subheadline)
                                Spacer()
                            }
                            .foregroundColor(Color.white)
                            .padding(8)
                            .frame(width: 90, height: 25)
                            .background(Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)))
                            .cornerRadius(8)
                        }
                        Text("Stats")
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 30)
                        VStack {
                            HStack (alignment: .bottom, spacing: 15) {
                                Text("HP")
                                Text("\(78)")
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
                                                .frame(width: 78, height: 20)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        )
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            HStack (alignment: .bottom, spacing: 15) {
                                Text("Attack")
                                Text("\(85)")
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
                                                .frame(width: 85, height: 20)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        )
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            HStack (alignment: .bottom, spacing: 15) {
                                Text("Defense")
                                Text("\(78)")
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
                                                .frame(width: 78, height: 20)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        )
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            HStack (alignment: .bottom, spacing: 15) {
                                Text("Sp. Atk")
                                Text("\(109)")
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
                                                .frame(width: 109, height: 20)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        )
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            HStack (alignment: .bottom, spacing: 15) {
                                Text("Sp. Def")
                                Text("\(85)")
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
                                                .frame(width: 85, height: 20)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        )
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            HStack (alignment: .bottom, spacing: 15) {
                                Text("Sp. Def")
                                Text("\(100)")
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
                                                .frame(width: 100, height: 20)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        )
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .padding(.horizontal, 30)
                        HStack (spacing: 40) {
                            HStack {
                                Image(systemName: "scalemass.fill")
                                    .foregroundColor(Color.primary)
                                    .font(.title2)
                                Text("90,5 kg")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            HStack {
                                Image(systemName: "ruler.fill")
                                    .foregroundColor(Color.primary)
                                    .font(.title2)
                                Text("1.7m")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                        }
                        .padding(.vertical, 30)
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
                VStack {
                    Text("#0006")
                        .font(.title)
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal, 30)
                    AsyncImage(url: url, content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300, alignment: .top)
                    }, placeholder : {
                        ProgressView()
                    })
                    Spacer()
                }
                
            }
            .toolbar {
                Group {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "arrow.left")
                            .font(.title)
                            .foregroundStyle(Color.white)
                            .padding(.leading, 10)
                            .padding(.vertical, 100)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("Charizard")
                            .font(.largeTitle)
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            .padding(.horizontal, 10)
                    }
                }
                .sharedBackgroundVisibility(.hidden)
            }
        }
    }
}

#Preview {
    ContentView()
}

//VStack {
//    Spacer()
//    VStack (alignment: .center){
//        HStack (spacing: 35){
//            VStack (spacing: 4){
//                Text("Stats")                             .foregroundColor(Color.primary)
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(Color.orange)
//                    .frame(width: 70, height: 2)
//                    .opacity(selectedPage == 0 ? 1 : 0)
//            }
//            VStack (spacing: 4){
//                Text("Moves")
//                    .foregroundColor(Color.secondary)
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(Color.orange)
//                    .frame(width: 70, height: 2)
//                    .opacity(selectedPage == 0 ? 0 : 1)
//            }
//        }
//        .font(.headline)
//        .frame(height: 60, alignment: .bottom)
//        Spacer()
//    }
//    .frame(maxWidth: .infinity, maxHeight: 480)
//    .background(Color.white)
//    .cornerRadius(40)
//    .shadow(
//        color: Color.primary,
//        radius: 10,
//        y: 8
//    )
//}
