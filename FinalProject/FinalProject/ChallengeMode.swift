//
//  ChallengeMode.swift
//  FinalProject
//
//  Created by Admin on 12/1/20.
//

import Foundation

class ChallengeMode : ObservableObject {
    @Published var curBoard : [Int] = []
    
    init() {
        restart()
    }
    func restart() {
        self.curBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
    func didWin() {
        
    }
    func didLose() {
        
    }
}
