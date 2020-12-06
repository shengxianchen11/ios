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
    @State var selection: String? = nil
    @State var select: Int? = nil
    var body: some View {
        NavigationView {
            VStack {
                Text("2048").font(.system(size: screenWidth / 5)).bold().foregroundColor(Color(#colorLiteral(red: 0.4582719207, green: 0.4315778613, blue: 0.3829891086, alpha: 1))).padding()
                NavigationLink (
                    destination: FourByFourGameView().environmentObject(NormalMode()).navigationBarBackButtonHidden(true).navigationBarHidden(true), tag: "fourbyfour", selection: $selection) {
                    Button(action: {selection = "fourbyfour"}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).frame(width: screenWidth / 2 + 20, height: screenWidth / 5 - 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color(#colorLiteral(red: 0.9291673303, green: 0.7658008933, blue: 0.2970429659, alpha: 1)))
                            Text("Normal Mode").foregroundColor(.white).font(.callout)
                        }
                    }.padding()
                }
                NavigationLink (
                    destination: ChallengeView().environmentObject(ChallengeMode()), tag: "fourbyfourchallenge", selection: $selection) {
                Button(action: {selection = "fourbyfourchallenge" }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5).frame(width: screenWidth / 2 + 20, height: screenWidth / 5 - 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color(#colorLiteral(red: 0.9511918426, green: 0.4921440482, blue: 0.3839553595, alpha: 1)))
                        Text("Challenging Mode").foregroundColor(.white).font(.callout)
                    }
                }.padding()
            }
                NavigationLink (destination: PicGameView().environmentObject(PicMode()).navigationBarBackButtonHidden(true).navigationBarHidden(true), tag: 4, selection: $select) {
                    Button(action: {select = 4}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).frame(width: screenWidth / 2 + 20, height: screenWidth / 5 - 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color(#colorLiteral(red: 0.03748401999, green: 0.7342836261, blue: 0.9375606179, alpha: 1)))
                            Text("Image Mode").foregroundColor(.white).font(.callout)
                        }
                    }.padding()
                }
                
                NavigationLink (destination: FiveByFiveGameView().environmentObject(FBoardMode()).navigationBarBackButtonHidden(true).navigationBarHidden(true), tag: 5, selection: $select) {
                    Button(action: {select = 5}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).frame(width: screenWidth / 2 + 20, height: screenWidth / 5 - 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                            Text("Five By Five").foregroundColor(.white).font(.callout)
                        }
                    }.padding()
                }
                Spacer()
                
            }.frame(width: screenWidth, height: screenHeight, alignment: .top).padding().background(Color(#colorLiteral(red: 0.986433208, green: 0.9689233899, blue: 0.9336025119, alpha: 1))).navigationBarHidden(true)
        }.frame(width: screenWidth, height: screenHeight, alignment: .top).background(Color(#colorLiteral(red: 0.986433208, green: 0.9689233899, blue: 0.9336025119, alpha: 1))).navigationBarHidden(true).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
