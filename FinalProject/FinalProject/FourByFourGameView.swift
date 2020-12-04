//
//  FourByFourGameView.swift
//  FinalProject
//
//  Created by Admin on 11/30/20.
//

import SwiftUI

struct FourByFourGameView: View {
    private let screenWidth : CGFloat = UIScreen.main.bounds.width
    private let screenHeight : CGFloat = UIScreen.main.bounds.height
    @EnvironmentObject var env : NormalMode
    @State var menu : Bool = false
    var body: some View {
        VStack {
            HStack(spacing: screenWidth / 20) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5).frame(width: screenWidth / 3.5, height: screenWidth / 3.5).foregroundColor(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
                    Text("2048").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().foregroundColor(.white)
                }
                
                VStack() {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).frame(width: screenWidth / 3.5, height: screenWidth / 5).foregroundColor(Color(#colorLiteral(red: 0.7184799314, green: 0.6823766828, blue: 0.6295595765, alpha: 1)))
                        VStack {
                            Text("Score").foregroundColor(.white)
                            Text("\(env.currentScore)").foregroundColor(.white).bold().font(.title)
                        }
                    }
                    
                    NavigationLink(
                        destination: ContentView(),
                        isActive: $menu) {
                        EmptyView()
                    }
                    Button (action: {self.menu.toggle()}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).frame(width: screenWidth / 3.5, height: screenWidth / 3.5 - screenWidth / 5 - 10).foregroundColor(Color(#colorLiteral(red: 0.9306581616, green: 0.6017062068, blue: 0.3565655947, alpha: 1)))
                            Text("MENU").bold().foregroundColor(.white)
                        }
                        
                    }
                }
                VStack() {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).frame(width: screenWidth / 3.5, height: screenWidth / 5).foregroundColor(Color(#colorLiteral(red: 0.7184799314, green: 0.6823766828, blue: 0.6295595765, alpha: 1)))
                        VStack {
                            Text("Highest").foregroundColor(.white)
                            Text("\(env.highestScore)").foregroundColor(.white).bold().font(.title)
                        }
                    }
                    
                    NavigationLink(
                        destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                        EmptyView()
                    }
                    Button (action: {env.restart()}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).frame(width: screenWidth / 3.5, height: screenWidth / 3.5 - screenWidth / 5 - 10).foregroundColor(Color(#colorLiteral(red: 0.9306581616, green: 0.6017062068, blue: 0.3565655947, alpha: 1)))
                            Text("RESET").bold().foregroundColor(.white)
                        }
                    }
                }
                
            }.padding(.top, screenHeight / 15)
            Spacer().frame(width: screenWidth, height: screenHeight / 7, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            BoardView().padding().environmentObject(env)
            Spacer()
        }.frame(width: screenWidth, height: screenHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding().background(Color(#colorLiteral(red: 0.976922214, green: 0.9693550467, blue: 0.9294282794, alpha: 1))).alert(isPresented: $env.gameState) {
            Alert(title: Text(env.endingInfo), dismissButton: .default(Text("Okay!")))
            }
    }
}


struct BoardView: View {
    @Namespace var namespace
    @EnvironmentObject var env : NormalMode
    private let width : CGFloat = UIScreen.main.bounds.width / 1.3 + 15
    private var rows : [GridItem] = [
        GridItem(.fixed((UIScreen.main.bounds.width / 1.3 + 15) / 4 - 4), spacing: 4),
        GridItem(.fixed((UIScreen.main.bounds.width / 1.3 + 15) / 4 - 4), spacing: 4),
        GridItem(.fixed((UIScreen.main.bounds.width / 1.3 + 15) / 4 - 4), spacing: 4),
        GridItem(.fixed((UIScreen.main.bounds.width / 1.3 + 15) / 4 - 4), spacing: 4)]
    private let screenWidth : CGFloat = UIScreen.main.bounds.width
    private let screenHeight : CGFloat = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5).frame(width: width, height: width).foregroundColor(Color(#colorLiteral(red: 0.7184799314, green: 0.6823766828, blue: 0.6295595765, alpha: 1)))
            LazyVGrid(columns: self.rows, spacing: 4) {
                ForEach(env.curSquares, id : \.id) { item in
                    SquareView(sq:item).frame(width: width / 4 - 4, height: width / 4 - 4)
                }
            }.animation(.easeInOut(duration: 0.5)).modifier(SwipeModifier())
        }
    }
}

struct SwipeModifier : ViewModifier {
    @EnvironmentObject var env : NormalMode
    func body(content: Content) -> some View {
        return content.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onEnded({ value in
            if value.translation.width < 0 && abs(value.translation.width) > abs(value.translation.height){
                env.swipeLeft()
            }

            else if value.translation.width > 0 && abs(value.translation.width) > abs(value.translation.height){
                env.swipeRight()
            }
            
            else if value.translation.height < 0 && abs(value.translation.width) < abs(value.translation.height) {
                env.swipeTop()
            }

            if value.translation.height > 0 && abs(value.translation.width) < abs(value.translation.height) {
                env.swipeBottom()
            }
        }))
    }
}

struct FourByFourGameView_Previews: PreviewProvider {
    static var previews: some View {
        FourByFourGameView().environmentObject(NormalMode())
    }
}
