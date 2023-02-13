//
//  animating gesture.swift
//  Swift100_34_Animation
//
//  Created by Zaiyuan Xiao on 2023/2/8.
//

import SwiftUI

struct animating_gesture: View {
    
    var letters = Array("Hello")
    @State private var  enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var dragAmount2 = CGSize.zero
    
    var body: some View {
        
        VStack{
            
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 200, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmount2)
                .animation(.default, value: dragAmount2)
                .gesture(
                DragGesture()
                    .onChanged{ dragAmount2 = $0.translation}
                    .onEnded{ _ in dragAmount2 = .zero}
                )
                
            
            HStack(spacing: 0) {
                ForEach(0..<letters.count, id: \.self) {
                    Text(String(letters[$0]))
                        .padding()
                        .background(Color(enabled ? .gray : .orange))
                    //NEW THINGS TO REMEMBER
                        .offset(dragAmount)
                        .animation(
                            .default.delay(Double($0)/20),
                            value: dragAmount
                        )
                }
            }
            //NEW THINGS TO REMEMBER
            .gesture(
                DragGesture()
                    .onChanged{ dragAmount = $0.translation }
                    .onEnded{ _ in
                        withAnimation(.spring()) {
                            dragAmount = .zero
                            enabled.toggle()
                        }
                    }
            )
        }
    }
}

struct animating_gesture_Previews: PreviewProvider {
    static var previews: some View {
        animating_gesture()
    }
}
