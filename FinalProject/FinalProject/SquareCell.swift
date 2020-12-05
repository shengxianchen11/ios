//
//  SquareCell.swift
//  FinalProject
//
//  Created by Admin on 12/2/20.
//

import Foundation
import SwiftUI
import UIKit
class Square : Identifiable {
    var id = UUID()
    var val : Int
    var color : Color = Color.black
    let dict : [Int : Color] = [0 : Color.black, 2 : Color(#colorLiteral(red: 0.935228765, green: 0.8936879039, blue: 0.8543376327, alpha: 1)), 4 : Color(#colorLiteral(red: 0.9276635647, green: 0.8789019585, blue: 0.7861097455, alpha: 1)), 8 : Color(#colorLiteral(red: 0.8811585307, green: 0.6454949975, blue: 0.4396341443, alpha: 1)), 16 : Color(#colorLiteral(red: 0.8801437616, green: 0.5452316999, blue: 0.3580117822, alpha: 1)), 32 : Color(#colorLiteral(red: 0.9736235738, green: 0.4818328023, blue: 0.3647759557, alpha: 1)), 64 : Color(#colorLiteral(red: 0.9774650931, green: 0.361032635, blue: 0.2288989425, alpha: 1)), 128 : Color(#colorLiteral(red: 0.9371373057, green: 0.8053933978, blue: 0.4517035484, alpha: 1)), 256 : Color(#colorLiteral(red: 0.9287114143, green: 0.7982175946, blue: 0.3827039003, alpha: 1)), 512 : Color(#colorLiteral(red: 0.9264746308, green: 0.7823480368, blue: 0.3159503341, alpha: 1)), 1024 : Color(#colorLiteral(red: 0.9274660349, green: 0.7745198607, blue: 0.2456761897, alpha: 1)), 2048 : Color(#colorLiteral(red: 0.9306139946, green: 0.7540300488, blue: 0.1741150022, alpha: 1)), 4096 : Color(#colorLiteral(red: 1, green: 0.2412319183, blue: 0.2339782119, alpha: 1)), 8192 : Color(#colorLiteral(red: 1, green: 0.1089343801, blue: 0.1226235852, alpha: 1)), 16384 : Color(#colorLiteral(red: 1, green: 0.1158090904, blue: 0.1279769242, alpha: 1)), 32768 : Color(#colorLiteral(red: 1, green: 0.1160008088, blue: 0.1211558804, alpha: 1)), 65536 : Color(#colorLiteral(red: 1, green: 0.1089343801, blue: 0.1226235852, alpha: 1))]
    
    init(val: Int) {
        self.val = val
        self.color = dict[val] ?? Color.black
    }
}

class ChallengeNode : Identifiable {
    var id = UUID()
    var val : Int
    var requirement : [Int]
    var done : Bool
    let req : [[Int]] = [
    [1, 2],
    [1, 8, 1, 16],
    [1, 8, 1, 16],
    [2, 8, 2, 16],
        [1, 8, 1, 16],
        [2, 8, 2, 16],
        [1, 8, 1, 16],
        [2, 8, 2, 16],
        [1, 8, 1, 16],
        [2, 8, 2, 16],
        [1, 8, 1, 16],
        [2, 8, 2, 16],
        [1, 8, 1, 16],
        [2, 8, 2, 16],
        [1, 8, 1, 16],
        [2, 8, 2, 16],
        [1, 8, 1, 16],
        [2, 8, 2, 16],
        [1, 8, 1, 16],
        [2, 8, 2, 16],
        [1, 8, 1, 16],
        [2, 8, 2, 16],
        [1, 8, 1, 16],
        [2, 8, 2, 16],
            [1, 8, 1, 16],
            [2, 8, 2, 16],
            [1, 8, 1, 16],
            [2, 8, 2, 16],
            [1, 8, 1, 16],
            [2, 8, 2, 16],
            [1, 8, 1, 16],
            [2, 8, 2, 16],
            [1, 8, 1, 16],
            [2, 8, 2, 16],
            [1, 8, 1, 16],
            [2, 8, 2, 16],
            [1, 8, 1, 16],
            [2, 8, 2, 16],
            [1, 8, 1, 16],
            [2, 8, 2, 16]]
    
    
    
    init(val: Int, done : Bool) {
        self.val = val
        self.requirement = req[val - 1]
        self.done = done
    }
    
    
    
}
