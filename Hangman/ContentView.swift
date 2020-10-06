//
//  ContentView.swift
//  Hangman
//
//  Created by Lauren Go on 2020/09/29.
//

import SwiftUI

struct ContentView: View {
    
    let buttonValues: [[String]] = [
        ["A", "B", "C", "D", "E", "F", "G"],
        ["H", "I", "J", "K", "L", "M", "N"],
        ["O", "P", "Q", "R", "S", "T", "U"],
        ["V", "W", "X", "Y", "Z"]
    ]
    
    var body: some View {
        
        VStack {
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Exit game")
                }).padding(.leading, 15)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Restart")
                }).padding(.trailing, 15)
            }.padding(.bottom, UIScreen.main.bounds.height * 0.05)
            
            Image("hangman1")
            Text("-----").font(.system(size: 50)).padding()
            Text("Incorrect guesses: ").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.leading, 15)
            
            Spacer()
            
            ForEach(buttonValues, id: \.self) {row in
                HStack {
                    ForEach(row, id: \.self) {button in
                        KeyboardButtonView(buttonLabel: button, buttonRow: row)
                    }
                }
            }
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top).padding(.bottom, UIScreen.main.bounds.height * 0.05)
    }
}

struct KeyboardButtonView: View {
    
    var buttonLabel: String
    var buttonRow: [String]
    
    var body: some View {
        
        Button(action: {
            // TODO: Add button tap functionality
            
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
