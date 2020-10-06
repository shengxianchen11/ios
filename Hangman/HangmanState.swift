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
    
    let phrases: [String] = ["hello", "goodbye", "bears", "corona", "covid", "facemask", "macbook", "oski"]
    let validChars: String = "abcdefghijklmnopqrstuvwxyz"
    var phrase: String!
    var lastGuess: String = ""
    
    /** Initializes a new game. */
    init() {
        self.phrase = self.phrases.randomElement()
        self.progress = ""
        self.incorrect = []
    }
    
    /** Get functions to control access for each Hangman instance's properties. */
    public func getPhrase() -> String { return phrase }
    public func getGuesses() -> Int { return 6-incorrect.count }
    public func getLastGuess() -> String { return lastGuess }
    public func getIncorrect() -> [Character] { return incorrect }
    public func getProgress() -> String { return progress}
    
    func restart() {
        self.phrase = self.phrases.randomElement()
        self.progress = ""
        self.incorrect = []
    }
    
    /**
     Checks for the loser
     - Returns: A Boolean for if the user won or not and has guesses left.
     */
    public func didLose() -> Bool {
        return incorrect.count >= 6
    }
    
    /**
     Checks for the winner.
     - Returns: A Boolean for if the user won or not and has guesses left.
     */
    public func didWin() -> Bool {
        return progress == phrase && incorrect.count < 6
    }
    
    /**
     Processes the user's guess.
     - Parameter guess letter: Character for the letter that is being guessed.
     */
    func makeGuess(guess letter: Character) {
        
        let lc_letter = Character(letter.lowercased())
        lastGuess = String(lc_letter).lowercased()
        
        if !incorrect.contains(lc_letter) {
            if phrase.contains(letter) {
                let progressTemp = phrase.map{char in (char == lc_letter) || progress.contains(char) ? char :  Character("_")}
                progress = String(progressTemp)
            } else {
                incorrect.append(lc_letter)
            }
        } else {
            // TODO: show alert to user that they have already guessed that letter
        }
    }
    
    /**
     Returns a message to notify the winner if they won or not
     
     - Returns: Message depending on whether they won or not
     */
    public func getFinalMessage() -> String {
        return didWin() ? "Congrats you win!" : "Rip you lost try again"
    }
    
    
    
}
