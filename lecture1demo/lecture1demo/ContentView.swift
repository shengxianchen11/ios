//
//  ContentView.swift
//  lecture1demo
//
//  Created by Admin on 9/18/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            HStack {
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("AC")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("+/-")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("%")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("÷")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
            }
            HStack {
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("7")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("8")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("9")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("×")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
            }
            HStack {
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("4")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("5")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("6")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("-")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
            }
                HStack {
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("1")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("2")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("3")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("+")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
            }
            HStack {
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("0")
                        .frame(width: 80*2, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
                
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Text(".")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                        
                }
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("=")
                        .frame(width: 80, height: 80)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(80 / 2)
                        .font(.title)
                }
            }
        }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:.infinity, alignment: .bottom)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
