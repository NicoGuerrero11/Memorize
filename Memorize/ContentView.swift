//
//  ContentView.swift
//  Memorize
//
//  Created by Nicolas Guerrero on 13/08/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = [
        "🐶","🐭", "🐼", "🐯",
        "🐶","🐭", "🐼", "🐯",
        "🐨","🦁", "🐵 ","🐦",
        "🐨","🦁", "🐵 ","🐦",
        "🐛", "🫎", "🪿", "🐴",
        "🐛", "🫎", "🪿", "🐴"
    ]
    
    @State var cardCount: Int = 8
    @State var flippedCards: [Bool] = Array(repeating: false, count: 8)
    
    var body: some View {
        ZStack{
            Color(red: 0.87, green: 0.91, blue: 0.90)
            VStack{
                Text("Memorize")
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(Color(red: 0.0, green: 0.55, blue: 0.55))
                Spacer()
                cards
                Spacer()
                buttonLevel
            }
            .padding()
        }
        
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()]){
            ForEach(0..<cardCount, id: \.self){index in
                CardView(content: emojis[index], isClick: $flippedCards[index])
            }
        }
        .foregroundColor(Color(red: 0.0, green: 0.55, blue: 0.55))
    
    }
    
    var buttonLevel: some View{
        HStack{
            // easy button
            Button("Easy"){
                if cardCount != 8{
                    cardCount = 8
                    flippedCards = Array(repeating: false, count: 8) // reset
                }
            }
            .disabled(cardCount == 8)
            .padding()
            
            // Medium button
            Button("Medium"){
                if cardCount != 16{
                    cardCount = 16
                    flippedCards = Array(repeating: false, count: 16) // reset
                }
            }
            .disabled(cardCount == 16)
            .padding()
            
            // hard button
            Button("Hard"){
                if cardCount != 24{
                    cardCount = 24
                    flippedCards = Array(repeating: false, count: 24) // reset
                }
            }
            .disabled(cardCount == 24)
            .padding()
        }
        .foregroundColor(Color(red: 0.0, green: 0.55, blue: 0.55))
        .font(.title2)
    }
    
    
}




struct CardView: View{
    let content: String
    @Binding var isClick: Bool
    var body: some View{
        
        ZStack{
            let base = Rectangle()
            
            Group{
                base.frame(width: 80, height: 80)
                base.fill(Color(red: 0.87, green: 0.91, blue: 0.90))
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isClick ? 1: 0)
            base.fill().opacity(isClick ? 0: 1)

        }
        .onTapGesture {
            isClick.toggle()
        }
        
        
    }
}

#Preview {
    ContentView()
}
