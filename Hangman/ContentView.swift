//
//  ContentView.swift
//  Hangman
//
//  Created by Lauren Go on 2020/09/29.
//

import SwiftUI
enum KeyboardButton: String {
    case A, B, C, D, E, F, G, H, I, J, K, L, M,
         N, O, P, Q, R, S, T, U, V, W, X, Y, Z
    case space = " "
    
}
struct ContentView: View {
    
    @EnvironmentObject var environment: HangmanViewModel
    
    let buttonValues: [[KeyboardButton]] = [
        [.A, .B, .C, .D, .E, .F, .G],
        [.H, .I, .J, .K, .L, .M, .N],
        [.O, .P, .Q, .R, .S, .T, .U],
        [.V, .W, .X, .Y, .Z]
    ]
    
    // TODO: an ObservedObject for the HangmanViewModel
    
    // TODO: Build the Hangman view!
    // 1. 2D array of button values for user inputs and the keyboard.
    // 2. Image that updates based on the HangmanViewModel's incorrect guesses count.
    // 3. Text that displays the incorrect guesses and updates based on the HangmanViewModel's incorrect guesses array.
    // 4. ForEach loop to create the custom keyboard. Reference the calculator app we created in lecture as it ~very~ similar.
    // 5. Add an alert. To be covered in Lecture 5.
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    self.environment.restart()
                }, label: {
                    Text("Restart").padding()
                })
            }
            
            Image("hangman\(self.environment.IncorrectGuesses)").resizable().frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 3)
            Spacer()
            Text(environment.curStr)
                    .font(.title)
            HStack {
                Text("Incorrect guesses:").padding(.leading)
                Text(self.environment.IncorrectList)
                Spacer()
            }
            Spacer()
            ForEach(buttonValues, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { button in
                        KeyBoardButtonView(button : button)
                    }
                }
            }
        }.alert(isPresented: $environment.gameStatus, content: {
            Alert(title: Text("Game Ends"), message: Text(self.environment.getFinalMessage()),
                  dismissButton: .default(Text("Got it!")))
        })
    }
}

struct KeyBoardButtonView: View {
    
    @EnvironmentObject var environment : HangmanViewModel
    var button : KeyboardButton
    var body : some View {
        Button(action: {
            if !(self.environment.didWin() || self.environment.didLose()) {
                self.environment.makeGuess(guess: button.rawValue[button.rawValue.startIndex])
            }
        },
        label: {
            Text(button.rawValue)
                .font(.system(size : 17))
                .frame(width: self.buttonWidth(button : button), height: self.buttonHeight())
                .foregroundColor(self.environment.didWin() || self.environment.didLose() ? .gray : /*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        })
    }
    
    func buttonWidth(button : KeyboardButton) -> CGFloat {
        let special = ["V", "W", "X", "Y", "Z"]
        if special.contains(button.rawValue) {
            return (UIScreen.main.bounds.width - 5 * 10) / 5
        }
        return (UIScreen.main.bounds.width - 7 * 10) / 7
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 7 * 10) / 7
    }
}
// TODO: Create KeyboardButtonView struct.
// Reference the CalculatorButtonView struct we created for the calculator app in lecture demos as it ~very~ similar.

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView().environmentObject(HangmanViewModel())
    }
}
