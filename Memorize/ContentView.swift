//
//  ContentView.swift
//  Memorize
//
//  Created by Nicolas Guerrero on 13/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.96, green: 0.94, blue: 0.91)
            VStack {
                CardView()
                CardView()
                CardView()
            }
            .padding()
            
        }
        
        
    }
}

struct CardView: View{
    var body: some View{
        HStack{
            CardConfig(isClick: true)
            CardConfig()
            CardConfig()
        }
        .foregroundColor(Color(red: 0.0, green: 0.55, blue: 0.55))
    }
}

struct CardConfig: View{
    var isClick: Bool = false
    var body: some View{
        
        ZStack{
            let base = Rectangle()
            
            if isClick{
                base.fill(Color(red: 0.87, green: 0.91, blue: 0.90))
                base.strokeBorder(lineWidth: 4)
            }
            else{
                base.fill()

            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
