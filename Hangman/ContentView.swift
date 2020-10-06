//
//  ContentView.swift
//  Hangman
//
//  Created by Lauren Go on 2020/09/29.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = HangmanState()
    
    let buttonValues: [[String]] = [
        ["A", "B", "C", "D", "E", "F", "G"],
        ["H", "I", "J", "K", "L", "M", "N"],
        ["O", "P", "Q", "R", "S", "T", "U"],
        ["V", "W", "X", "Y", "Z"]
    ]
    
    var body: some View {
        
        VStack {
            
            HStack {
                Spacer()
                Button(action: {
                    model.restart()
                }, label: {
                    Text("Restart")
                }).padding(.trailing, 15)
            }.padding(.bottom, UIScreen.main.bounds.height * 0.05)
            
            Image("hangman\(model.index)")
            Text(model.getProgress()).font(.system(size: 50)).padding()
            Text("Incorrect guesses: " + String(model.incorrect)).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.leading, 15)
            
            
            ForEach(buttonValues, id: \.self) {row in
                HStack {
                    ForEach(row, id: \.self) {button in
                        KeyboardButtonView(model: model, buttonLabel: button, buttonRow: row)
                    }
                }
            }
            
        }.padding(5)
        .alert(isPresented: $model.gameOver) {
            Alert(title: Text("Game Over"),
                  message: Text(model.getFinalMessage()),
                  dismissButton: .default(Text("Ok"), action: { model.restart()}))
        }
    }
}

struct KeyboardButtonView: View {
    
    @ObservedObject var model: HangmanState
    var buttonLabel: String
    var buttonRow: [String]
    
    var body: some View {
        
        Button(action: {
            model.makeGuess(guess: Character(buttonLabel))
        }, label: {
            Text(buttonLabel)
                .frame(width: self.buttonWidth(row: buttonRow), height: self.buttonHeight())
        })
    }
    
    func buttonWidth(row: [String]) -> CGFloat {
        if row[0] == "V" {
            return (UIScreen.main.bounds.width - 6 * 10) / 6
        } else {
            return (UIScreen.main.bounds.width - 8 * 10) / 8
        }
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 6 * 10) / 8
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
