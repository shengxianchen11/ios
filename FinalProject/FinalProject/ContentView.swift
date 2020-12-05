//
//  ContentView.swift
//  FinalProject
//
//  Created by Admin on 11/30/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var env : NormalMode
    @EnvironmentObject var pic : PicMode
    private let screenWidth : CGFloat = UIScreen.main.bounds.width
    private let screenHeight : CGFloat = UIScreen.main.bounds.height
    @State var selection: String? = nil
    @State var select: Int? = nil
    var body: some View {
        NavigationView {
            VStack {
                Text("2048").font(.system(size: screenWidth / 5)).bold().foregroundColor(Color(#colorLiteral(red: 0.4582719207, green: 0.4315778613, blue: 0.3829891086, alpha: 1))).padding()
                NavigationLink (
                    destination: FourByFourGameView().environmentObject(env).navigationBarBackButtonHidden(true).navigationBarHidden(true), tag: "fourbyfour", selection: $selection) {
                    Button(action: {selection = "fourbyfour"}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).frame(width: screenWidth / 2 + 20, height: screenWidth / 5 - 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color(#colorLiteral(red: 0.9291673303, green: 0.7658008933, blue: 0.2970429659, alpha: 1)))
                            Text("Normal Mode").foregroundColor(.white).font(.callout)
                        }
                    }.padding()
                }
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5).frame(width: screenWidth / 2 + 20, height: screenWidth / 5 - 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color(#colorLiteral(red: 0.9511918426, green: 0.4921440482, blue: 0.3839553595, alpha: 1)))
                        Text("Challenging Mode").foregroundColor(.white).font(.callout)
                    }
                }.padding()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5).frame(width: screenWidth / 2 + 20, height: screenWidth / 5 - 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color(#colorLiteral(red: 0.6447030306, green: 0.5756409764, blue: 0.5053991675, alpha: 1)))
                        Text("Daily Life").foregroundColor(.white).font(.callout)
                    }
                }.padding()
//                NavigationLink (
//                    destination: PicGameView().environmentObject(pic).navigationBarBackButtonHidden(true).navigationBarHidden(true), tag: 4, selection: $select) {
//
//                }
                Button(action: {}) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5).frame(width: screenWidth / 2 + 20, height: screenWidth / 5 - 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color(#colorLiteral(red: 0.03748401999, green: 0.7342836261, blue: 0.9375606179, alpha: 1)))
                        Text("Image Mode").foregroundColor(.white).font(.callout)
                    }
                }.padding()
                
                
                Spacer()
                
            }.frame(width: screenWidth, height: screenHeight, alignment: .top).padding().background(Color(#colorLiteral(red: 0.986433208, green: 0.9689233899, blue: 0.9336025119, alpha: 1))).navigationBarHidden(true)
        }.frame(width: screenWidth, height: screenHeight, alignment: .top).background(Color(#colorLiteral(red: 0.986433208, green: 0.9689233899, blue: 0.9336025119, alpha: 1))).navigationBarHidden(true).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(NormalMode())
    }
}
