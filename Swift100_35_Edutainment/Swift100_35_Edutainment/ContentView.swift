//
//  ContentView.swift
//  temporary
//
//  Created by Zaiyuan Xiao on 2023/2/5.
//
import Foundation
import SwiftUI






struct ContentView: View {
    
    @State private var tableMultiplication: Int = 1
    @State private var numOfQuestion: Int = 1
    @State private var submittedAnswer: Int = 0
    @State private var questions = [String]()
    @State private var answer = [Int]()
    @State private var currentIndex = 0
   
    @State private var round = 0
    @State private var point = 0
    
    @State private var popUp = false
    @State private var gameView = false
    
    @State private var animationAmount = 100
    
    var numberOfQuestions = [5, 10, 20]
    
    var body: some View {
        
        ZStack{
            
            /*    ---------------------dashboard----------------------    */
            
            VStack{
                Form {
                    Picker("Number of Question", selection: $numOfQuestion) {
                        ForEach(numberOfQuestions, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    
                    Picker("Difficulty \(tableMultiplication)*\(tableMultiplication)", selection: $tableMultiplication) {
                        ForEach(2..<13, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }.pickerStyle(.inline)
                
                
                Button {
                    generateQuestion(num: numOfQuestion, tableLevel: tableMultiplication)
                    gameView = true
                } label: {
                    Text("CONFIRMATION")
                }.buttonStyle(.borderedProminent)
            }
            
            /*    ---------------------gameview----------------------     */
            
            if gameView {
                
                Form{
                    Text(questions[currentIndex])
                    TextField("Input Your Answer", value: $submittedAnswer, format:.number)
                }
                .keyboardType(.numberPad)
                .onSubmit {
                    duringGame(submittedAnswer)
                }
                .alert(point > numOfQuestion*10*(8/10) ? "Well Done! Your Score is \(point)" : "Try again, you got this", isPresented: $popUp) {
                    Button("RESTART", action: gameEnds)
                }
                
                VStack{
                    Text("point: \(point)")
                    Text("round: \(round)/\(numOfQuestion)")
                }
            }
        }
        
        
    }
    
    
    
    
    /*---------------------------------------method----------------------------------------------*/
    
    func generateQuestion(num numOfQuestion: Int, tableLevel tableMultiplication: Int) {
        for _ in 0...numOfQuestion {
            let x = Int.random(in: 1...tableMultiplication)
            let y = Int.random(in: 0...tableMultiplication)
            questions.append("\(x) * \(y)")
            answer.append(x*y)
        }
    }
    
    func duringGame(_ submission: Int) {
        if answer[currentIndex] == submission {
            point += 10
        }
        currentIndex += 1
        round += 1
        if currentIndex == numOfQuestion {
            popUp = true
        }
    }

    func gameEnds() {
        gameView = false
        point = 0
        round = 0
    }
    
    
    
    
    
}

/*---------------------------------------preview----------------------------------------------*/
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



