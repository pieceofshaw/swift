//
//  ContentView.swift
//  Swift100_31_ WordScramble_project5
//
//  Created by Zaiyuan Xiao on 2023/2/7.
//

//28 建立UI 大致外形 -> 处理input FUNCTION -> 文字列表 -> animation
//29 导入文件-> 检查文件 -> 导成string -> 处理string FUNCTION -> 出示
//30 1）功能一：没有重复过 2）功能二：是否合格 3）功能三：是否存在 4）功能四：error

import SwiftUI

struct ContentView: View {
    @State private var newWord = ""
    @State private var usedWord = [String]()
    @State private(set) var rootWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    
    var body: some View {
        NavigationStack{
            
            List {
                Section {
                    TextField("enter", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWord, id: \.self) { word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("ok", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }
            .onSubmit {
                addNewWord()
            }
        }
    }
    
    func startGame() {
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWord = try? String(contentsOf: startWordURL) {
                let allWords = startWord.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                
                return
            }
            
        }
        fatalError("Error Occurs")
    }
    
    
    
    func addNewWord() {
        //先改format 然后检查合格与否 然后加到list 最后清空
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {return}
        
        guard isOriginal(answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation{
            usedWord.insert(answer, at: 0)
        }
        newWord = ""
        
    }
    
    
    
    
    func isOriginal(_ word: String) -> Bool {
        !usedWord.contains((word))
    }
    
    
    func isPossible(_ word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    // need two things for rangeOfMisspelledWord: checker(UITextChecker()) & range(NSRange)
    //return misspelledRange.location == NSNotFound
    func isReal(_ word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
