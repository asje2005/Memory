//
//  ContentView.swift
//  Memory
//
//  Created by Aaron Sylvis on 6/27/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🦋","🐞","🐜","🐝","🪳","🦟","🪱","🪲"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            HStack{
                ForEach(0..<cardCount, id: \.self){ index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.orange)
            
            HStack{
                Button(action: {
                    if cardCount > 1 {
                        cardCount -= 1
                    }
                }, label: {
                    Image(systemName: "rectangle.stack.fill.badge.minus")
                })
                
                Spacer()
                Button(action: {
                    if cardCount < emojis.count {
                        cardCount += 1
                    }
                }, label: {
                    Image(systemName: "rectangle.stack.fill.badge.plus")
                })
            }
                .imageScale(.large)
                .font(.largeTitle)
            }
        .padding()
    }
}
    struct CardView: View {
        let content: String
        @State var isFaceUp = true
        
        var body: some View {
            ZStack {
                var base : RoundedRectangle = RoundedRectangle(cornerRadius: 12)
                if isFaceUp{
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 3)
                    Text(content).font(.largeTitle)
                } else{
                    base.fill()
                }
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

