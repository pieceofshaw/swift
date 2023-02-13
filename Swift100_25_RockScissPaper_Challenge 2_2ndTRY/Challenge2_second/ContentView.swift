//
//  ContentView.swift
//  Challenge2_second
//
//  Created by Zaiyuan Xiao on 2023/2/6.
//

import SwiftUI

//var handShow = ["rock", "scissor", "paper"]
//var showHand = Int.random(in: 0...2)



struct ContentView: View {
    
    
    enum HandShow: String, CaseIterable {
        case rock, scissor, paper
    }
    @State private var handShow = HandShow.allCases.randomElement()
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var round = 0
    @State private var popUp = false
    
    
    var body: some View {
        
        
        NavigationStack{
            VStack {
                Image(handShow?.rawValue ?? "none")
                    .resizable()
                    .frame(width: 300, height: 250)
                    .offset(y:-50)
                
                
                VStack(alignment: .center){
                    Text("In order to")
                    Text(winOrLose())
                        .bold()
                        .frame(width: 100, height: 60)
                        .background(shouldWin ? .green : .red)
                        .cornerRadius(15)
                    Text("choose")
                }
                .font(.title)
                
                HStack {
                    
                    
                    ForEach(HandShow.allCases, id: \.self) {name in
                        Button {
                            pointSystem(name.rawValue)
                        } label: {
                            Image(name.rawValue)
                                .resizable()
                                .frame(width: 100, height: 80)
                                .background()
                        }
                    }
                }
                
                HStack(spacing: 50) {
                    Text("Score: \(score)")
                    Text("Round: \(round)/10")
                } .offset(y: 30)
            }
            .navigationTitle("ROCK PAPER SCISSOR")
            .navigationBarTitleDisplayMode(.inline)
            .alert("GAME OVER", isPresented: $popUp) {
                Button("Continue") {
                    score = 0
                    round = 0
                }
            } message: {
                Text("YOUR SCORE IS \(score)")
            }
        }
    }
    
    func winOrLose() -> String {
        if shouldWin == true {
            return "WIN"
        } else {
            return "LOSE"
        }
    }
    
    
    func pointSystem(_ choice: String) {
        let computerShow = handShow?.rawValue
        
        if shouldWin == false {
            if choice == "rock" {
                switch computerShow {
                case "rock", "scissor":
                    score -= 1
                case "paper" :
                    score += 1
                default:
                    return
                }
            } else if choice == "paper" {
                switch computerShow {
                case "rock", "paper":
                    score -= 1
                case "scissor" :
                    score += 1
                default:
                    return
                }
            } else {
                switch computerShow {
                case "scissor", "paper":
                    score -= 1
                case "rock" :
                    score += 1
                default:
                    return
                }
            }
        } else {
            if choice == "scissor" {
                switch computerShow {
                case "rock", "scissor":
                    score -= 1
                case "paper" :
                    score += 1
                default:
                    return
                }
            } else if choice == "rock" {
                switch computerShow {
                case "rock", "paper":
                    score -= 1
                case "scissor" :
                    score += 1
                default:
                    return
                }
            } else {
                switch computerShow {
                case "scissor", "paper":
                    score -= 1
                case "rock" :
                    score += 1
                default:
                    return
                }
            }
        }
        
        round += 1
        handShow = HandShow.allCases.randomElement()
        shouldWin = Bool.random()
        nextGame()
    }
    
    func nextGame() {
        if round == 10 {
            popUp.toggle()
        }
    }
    
    
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
