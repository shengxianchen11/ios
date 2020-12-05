//
//  ChallengeView.swift
//  FinalProject
//
//  Created by Admin on 12/4/20.
//

import SwiftUI

struct ChallengeView: View {
    @EnvironmentObject var env : ChallengeMode
    private var rows : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: rows, spacing: 20) {
                    ForEach (env.curNodes, id: \.id) { node in
                        LockView(node: node).environmentObject(env)
                    }
                }
            Spacer()
            }
        }.navigationBarHidden(true)
    }
}

struct LockView: View {
    @EnvironmentObject var env : ChallengeMode
    let screenWidth = UIScreen.main.bounds.width
    var node : ChallengeNode
    @State var b : Bool = false
    var body: some View {
        NavigationLink (
            destination: FourByFourChallenge().environmentObject(env),
            isActive: $b){
            Button(action: {b.toggle()
                    env.changeLevel(l: node.val - 1)}, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 0).frame(width: screenWidth / 5 - 10, height: screenWidth / 5 - 10).foregroundColor(.green)
                if (node.done) {
                    Text(String(node.val)).bold().foregroundColor(.white)
                } else {
                    Image(systemName: "lock.circle").resizable().frame(width: screenWidth / 6 - 10, height: screenWidth / 6 - 10)
                }
                
            }
            }).disabled(!node.done)
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView().environmentObject(ChallengeMode())
    }
}
