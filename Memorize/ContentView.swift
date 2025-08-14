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
    
    @State var cardCount: Int = 16
    
    var body: some View {
        VStack{
            cards
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()]){
            ForEach(0..<cardCount, id: \.self){index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(Color(red: 0.0, green: 0.55, blue: 0.55))
    
    }
}




struct CardView: View{
    @State var isClick: Bool = false
    let content: String
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
            isClick = !isClick
        }
        
        
    }
}

#Preview {
    ContentView()
}
