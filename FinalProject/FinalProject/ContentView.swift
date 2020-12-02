//
//  ContentView.swift
//  FinalProject
//
//  Created by Admin on 11/30/20.
//

import SwiftUI

struct ContentView: View {
    private let screenWidth : CGFloat = UIScreen.main.bounds.width
    private let screenHeight : CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView {
            VStack {
                Text("2048").font(.system(size: screenWidth / 5 - 10)).bold().foregroundColor(Color.gray).padding()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5).frame(width: screenWidth / 2 + 20, height: screenWidth / 5 - 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color(#colorLiteral(red: 0.8384206891, green: 0.8656702638, blue: 0, alpha: 1)))
                        Text("Normal Mode").foregroundColor(.white).font(.callout)
                    }
                }.padding()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5).frame(width: screenWidth / 2 + 20, height: screenWidth / 5 - 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
                        Text("Challenging Mode").foregroundColor(.white).font(.callout)
                    }
                }.padding()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5).frame(width: screenWidth / 2 + 20, height: screenWidth / 5 - 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        Text("Daily Life").foregroundColor(.white).font(.callout)
                    }
                }.padding()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5).frame(width: screenWidth / 2 + 20, height: screenWidth / 5 - 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                        Text("Image Mode").foregroundColor(.white).font(.callout)
                    }
                }.padding()
                
                Spacer()
                
            }.frame(width: screenWidth, height: screenHeight, alignment: .top).padding().background(Color(#colorLiteral(red: 0.9625877738, green: 0.9856839776, blue: 1, alpha: 1)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
