//
//  ContentView.swift
//  Swift100_34_Animation
//
//  Created by Zaiyuan Xiao on 2023/2/8.
//

import SwiftUI



struct ContentView: View {
    @State private var isShowingRed = false
    var body: some View {
        
            ZStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 200, height: 200)
                
                if isShowingRed {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                        .transition(.pivot)
                }
            }
            .onTapGesture {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
        }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
