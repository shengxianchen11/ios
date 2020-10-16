//
//  HangmanState.swift
//  Hangman
//
//  Created by Lauren Go on 2020/09/29.
//

import Foundation

class HangmanViewModel : ObservableObject {
    @Published var IncorrectGuesses : Int = 0
    @Published var IncorrectList : String = String()
    @Published var currentStatus : [Character] = []
    @Published var gameStatus : Bool = false
    @Published var curStr : String = String()
    // TODO: Add @Published properties used to control apperance of ContentView:
    // 1. Number of incorrect guesses. To be used for the hangman image, checking win/lose states, etc.
    // 2. Incorrect guesses. An array that stores the incorrectly guessed characters.
    // 3. Progress towards the phrase. A string that starts as "-" and updates with each correct guess.
    // 4. Game status. Boolean of whether or not the game is over.
    
    // TODO: Add variables to handle game logic:
    // 1. The phrase to be guessed by the user randomly chosen from the phrases array.
    // 2. Add phrases to the phrases array to customize your experience or just have some fun!
    let phrases: [String] = ["hello", "Jun is my son"] // you can change these
    
    var currentPhrase : String = ""
    /** Initializes a new game. */
    init() {
        restart()
    }
    
    /** Resets model properties to restart game. */
    func restart() {
        self.currentPhrase = phrases.randomElement() ?? "no"
        self.IncorrectGuesses = 0
        self.IncorrectList = String()
        self.currentStatus = constructStatus(curPhrase : currentPhrase)
        self.gameStatus = false
        update()
        // TODO: This function resets the game to its initial state. Think about what variables and @Published properties should look like when starting a new game. Here are some things to think about:
        // 1. Randomly select a new phrase from the phrases array and set the game phrase.
        // 2. Reset your progress string to reflect the initial state of this newly selected phrase.
        // 3. Reset other things to reflect the intial state like incorrect guesses, number of incorrect guesses, game status, etc.
    }
    
    func constructStatus(curPhrase : String) -> [Character] {
        var res : [Character] = []
        for char in curPhrase {
            if char == " " {
                res.append(char)
            } else {
                res.append("-")
            }
            
        }
        return res
    }
    
    
    /**
     Checks if the game has reached a lose state.
     - Returns: A Boolean for if the user won or not and has guesses left.
     */
    public func didLose() -> Bool {
        // TODO: This function should check the number of incorrect guesses to determine if the user has lost the game.
        return IncorrectGuesses == 6
    }
    
    /**
     Checks if the game has reached a win state.
     - Returns: A Boolean for if the user won or not and has guesses left.
     */
    public func didWin() -> Bool {
        // TODO: This function should check the number of incorrect guesses and the progress variable to determine if the user has won the game.
        return IncorrectGuesses < 6 && !currentStatus.contains("-")
    }
    
    /**
     Processes the user's guess.
     - Parameter guess letter: Character for the letter that is being guessed.
     */
    func makeGuess(guess letter: Character) {
        // TODO: Update variables and parameters to reflect the user's input.
        // 1. Check that the user has not already guessed the letter.
        // 2. If the phrase contains the guessed letter, update the progress string to show that letter.
        // 3. If the phrase does not contain the guessed letter, add the letter to the incorrect guesses array and iterate the incorrect guesses count.
        if (IncorrectList.contains(letter)) {
            return
        }
        let c = inside(str: currentPhrase, char: letter)
        if c != -1 {
            currentStatus[c] = letter
            update()
            if didWin() {
                gameStatus = true
            }
        } else {
            IncorrectList.append(letter)
            IncorrectGuesses += 1
            if didLose() {
                gameStatus = true
            }
        }
    }
    
    func update() {
        curStr.removeAll()
        for char in currentStatus {
            curStr.append(char)
        }
    }
    
    
    func inside(str : String, char : Character) -> Int {
        for i in 0...str.count - 1 {
            let a = str[str.index(str.startIndex, offsetBy: i)]
            let b = currentStatus[i]
            if a.lowercased() == char.lowercased() && b == "-" {
                return i
            }
        }
        return -1
    }
    /**
     Returns a message to notify the winner if they won or not
     - Returns: Message depending on whether they won or not
     */
    public func getFinalMessage() -> String {
        // TODO: Check the game state using the didWin/didLose functions and return an appropriate string.
        if didWin() {
            return "You won the game!"
        } else {
            return "You lost, the correct word is \(self.currentPhrase)"
        }
    }
    
    
    
}
