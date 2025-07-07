//
//  ContentView.swift
//  Memory
//
//  Created by Aaron Sylvis on 6/27/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🦋","🐞","🐜","🐝","🪳"]
    //:Array<String> =
    
    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding(.horizontal)
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
