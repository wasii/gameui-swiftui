//
//  ContentView.swift
//  GameApp
//
//  Created by Abul Jaleel on 29/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Home()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(.hidden, for: .navigationBar)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct Home: View {
    var body: some View {
        VStack {
            HStack {
                Text("Your Player")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                
                Spacer()
                
                Button {} label: {
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.title)
                        .foregroundStyle(Color.white)
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(players) { player in
                        Card(player: player)
                    }
                }
                .padding(.bottom)
            }
        }
        .background(
            LinearGradient(
                colors: .init([Color("Color"), Color("Color1")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea(edges: .all)
        )
    }
}

struct Card: View {
    var player: Player
    var body: some View {
        HStack {
            Image(player.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 1.8)
            
            Spacer()
            
            VStack(spacing: 15) {
                Spacer(minLength: 0)
                Image(systemName: "bolt.fill")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background {
                        ZStack {
                            player.color
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 5)
                            Circle()
                                .trim(from: 0.0, to: player.powers[0])
                                .stroke(Color.white, lineWidth: 5)
                        }
                        .rotationEffect(.init(degrees: -90))
                    }
                    .clipShape(Circle())
                
                Image(systemName: "suit.heart.fill")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background {
                        ZStack {
                            player.color
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 5)
                            Circle()
                                .trim(from: 0.0, to: player.powers[1])
                                .stroke(Color.white, lineWidth: 5)
                        }
                        .rotationEffect(.init(degrees: -90))
                    }
                    .clipShape(Circle())
                
                Image(systemName: "hammer.fill")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background {
                        ZStack {
                            player.color
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 5)
                            Circle()
                                .trim(from: 0.0, to: player.powers[2])
                                .stroke(Color.white, lineWidth: 5)
                        }
                        .rotationEffect(.init(degrees: -90))
                    }
                    .clipShape(Circle())
                
                Spacer(minLength: 0)
                
                
                NavigationLink(destination: DetailView(player: player)) {
                    Text("See Details")
                        .font(.caption)
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background (Capsule().stroke(Color.white, lineWidth: 2))
                        .offset(y: -30)
                }
            }
            .padding(.trailing)
        }
        .frame(height: 290)
        .background(
            Color.white.opacity(0.1)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .rotation3DEffect(
                    .init(degrees: 20), axis: (x: 0, y: -1.0, z: 0.0)
                )
                .padding(.vertical, 35)
                .padding(.trailing, 25)
        )
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}



struct DetailView: View {
    let player: Player
    
    @Environment(\.presentationMode) var present
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button {
                        self.present.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundStyle(Color.black)
                    }
                    Spacer()
                    Text("Overview")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                    
                    Button {} label: {
                        Image(systemName: "circle.grid.2x2.fill")
                            .font(.title)
                            .foregroundStyle(Color.black)
                    }
                }
            }
            .padding()
            
            
            Image(player.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width - 30, height: UIScreen.main.bounds.size.height / 2)
                .background(Color.white.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                
            Text(player.name)
                .fontWeight(.bold)
                .font(.system(size: 55))
                .foregroundStyle(Color.white)
                .padding(.top)
            
            Text("Super smash bros ultimate\nchanllenges from the animal crossing series.\nThis troops fight most effictively in large group")
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.white)
            
            HStack(spacing: 20) {
                Button {} label: {
                    Text("Add Favourite")
                        .foregroundStyle(Color.white)
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                        .background(Capsule().stroke(Color.white, lineWidth: 2))
                }
                
                Button {} label: {
                    Text("Play Now")
                        .foregroundStyle(Color.white)
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                        .background(Color("Color4"))
                        .clipShape(Capsule())
                }
            }
            .padding(.top, 30)
            
            Spacer()
        }
        .background(
            LinearGradient(colors: [Color("Color2"),Color("Color3")], startPoint: .top,endPoint: .leading)
                .ignoresSafeArea(edges: .all)
        )
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
    }
}



struct Player: Identifiable, Hashable {
    var id: Int
    var powers: [CGFloat]
    var image: String
    var name: String
    var color: Color
}

var players = [
    Player(
        id: 0,
        powers: [0.2, 0.5, 0.9],
        image: "Player1",
        name: "Bomb Raider",
        color: Color("Color")
    ),
    Player(
        id: 1,
        powers: [0.3, 0.5, 0.6],
        image: "Player2",
        name: "Pekka",
        color: Color("Color1")
    ),
    Player(
        id: 2,
        powers: [0.5, 0.4, 0.8],
        image: "Player3",
        name: "Barberian",
        color: Color("Color2")
    )
]
