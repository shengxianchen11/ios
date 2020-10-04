//
//  HangmanState.swift
//  Hangman
//
//  Created by Lauren Go on 2020/09/29.
//

import Foundation

class HangmanState : ObservableObject {
    @Published var index: Int = 0
    @Published var progress: String = ""
    @Published var incorrect: [Character] = []
    
    let validChars: String = "abcdefghijklmnopqrstuvwxyz"
    
    var phrase: String
    
    init(phrase: String) {
        self.phrase = phrase
        self.progress = phrase.characters.map({})
    }
    
    public func didLose() -> Bool {
        return incorrect.count >= 6
    }
    public func didWin() -> Bool {
        return progress == phrase && incorrect.count < 6
    }
    
    // make guess, return true if not guessed before, false if have guessed
    func makeGuess(_ c: Character) {
        let letter = c.lowercased()
        
        if validChars.contains(c) && !progress.contains(c) {
            
        } else {
            
        }
    }
}
