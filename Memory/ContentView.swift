//
//  ContentView.swift
//  Memory
//
//  Created by Aaron Sylvis on 6/27/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🦋","🐞","🐜","🐝","🪳","🦟","🪱","🪲","🦗"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardAdjusters
        }
        .padding()
    }
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 155))]){
        //(columns: [GridItem(),GridItem(),GridItem() ]){
        
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        
    }
    
    var cardAdjusters : some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
            .imageScale(.large)
            .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover : some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder : some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

    struct CardView: View {
        let content: String
        @State var isFaceUp = true
        
        var body: some View {
            ZStack {
                let base : RoundedRectangle = RoundedRectangle(cornerRadius: 12)
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 3)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ? 0 : 1)
            }
            .onTapGesture{
                isFaceUp.toggle()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }

