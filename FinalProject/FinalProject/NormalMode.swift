//
//  2048model.swift
//  FinalProject
//
//  Created by Admin on 11/30/20.
//

import Foundation

class NormalMode : ObservableObject {
    @Published var curBoard : [Int] = []
    @Published var gameState : Bool = false
    let boardsize = 4
    init() {
        restart()
    }
    
    func restart() {
        self.curBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        assert(self.curBoard.count == boardsize * boardsize, "Not a four by four Board")
        generateNewNum()
        generateNewNum()
    }
    func generateNewNum() {
        var current : [Int] = []
        for item in 0..<boardsize * boardsize {
            if curBoard[item] == 0 {
                current.append(item)
            }
        }
        if (current.count == 0) {
            if (didLose()) {
                print("lose the game")
            }
            return
        }
        let randomIndex = current.randomElement()!
        self.curBoard[randomIndex] = flipCoin() ? 2 : 4
    }
    
    /** Split the current board into rows, then do each operation on each row*/
    func swipeLeft() {
        var current : [[Int]] = [[], [], [], []]
        for row in 0..<boardsize {
            for col in 0..<boardsize {
                current[row].append(self.curBoard[row * boardsize + col])
            }
        }
        for row in 0..<boardsize {
            let new  = operate(lst: current[row])
            current[row] = new
        }
        for row in 0..<boardsize {
            for col in 0..<boardsize {
                self.curBoard[row * boardsize + col] = current[row][col]
            }
        }
    }
    
    /** Split the current board into rows, then reverse the row, do the operation, reverse the row again,*/
    func swipeRight() {
        var current : [[Int]] = [[], [], [], []]
        for row in 0..<boardsize {
            for col in 0..<boardsize {
                current[row].append(self.curBoard[row * boardsize + col])
            }
        }
        for row in 0..<boardsize {
            current[row] = reverse(lst: current[row])
        }
        for row in 0..<boardsize {
            let new  = operate(lst: current[row])
            current[row] = new
        }
        for row in 0..<boardsize {
            current[row] = reverse(lst: current[row])
        }
        for row in 0..<boardsize {
            for col in 0..<boardsize {
                self.curBoard[row * boardsize + col] = current[row][col]
            }
        }
    }
    
    /** Split the current board into cols, do the operation*/
    func swipeBottom() {
        var current : [[Int]] = [[], [], [], []]
        for col in 0..<boardsize {
            for row in 0..<boardsize {
                current[col].append(self.curBoard[row * boardsize + col])
            }
        }
        for col in 0..<boardsize {
            let new  = operate(lst: current[col])
            current[col] = new
        }
        for col in 0..<boardsize {
            for row in 0..<boardsize {
                self.curBoard[row * boardsize + col] = current[col][row]
            }
        }
    }
    
    /** Split the current board into cols, then reverse the col, do the operation, reverse the col again,*/
    func swipeTop() {
        var current : [[Int]] = [[], [], [], []]
        for col in 0..<boardsize {
            for row in 0..<boardsize {
                current[col].append(self.curBoard[row * boardsize + col])
            }
        }
        for col in 0..<boardsize {
            current[col] = reverse(lst: current[col])
        }
        for col in 0..<boardsize {
            let new  = operate(lst: current[col])
            current[col] = new
        }
        for col in 0..<boardsize {
            current[col] = reverse(lst: current[col])
        }
        for col in 0..<boardsize {
            for row in 0..<boardsize {
                self.curBoard[row * boardsize + col] = current[col][row]
            }
        }
    }
    /** According to 2048 rules, we shall make a list like
            [4, 0, 0, 2] -> [4, 2, 0, 0]
            [2, 2, 0, 0] -> [4, 0, 0, 0]
            [4, 4, 0, 0] -> [8, 0, 0, 0]
            [4, 4, 4, 4] -> [8, 8, 0, 0]
            [8, 8, 0, 0] -> [16, 0, 0, 0]
     
     */
    func operate(lst : [Int]) -> [Int] {
        assert(lst.count == boardsize, "invalid size of row")
        var new : [Int] = []
        for i in 0..<boardsize {
            new.append(lst[i])
        }
        var index = 0
        var touch : [Int] = []
        while index < lst.count {
            if index == 0 || lst[index] == 0 {
                index += 1
                continue
            }
            var temp = index
            while temp > 0 {
                let curr = new[temp]
                let prev = new[temp - 1]
                if curr == prev && !touch.contains(temp - 1) {
                    touch.append(temp - 1)
                    new[temp - 1] = curr + prev
                    new[temp] = 0
                } else if prev == 0 {
                    new[temp - 1] = curr
                    new[temp] = 0
                }
                temp -= 1
            }
            index += 1
         }
        return new
    }
    
    
    
    func reverse(lst : [Int]) -> [Int] {
        var new : [Int] = []
        for i in 0..<lst.count {
            new.append(lst[lst.count - i])
        }
        return new
    }
    
    func flipCoin() -> Bool {
        return Bool.random()
    }
    
    /** Return true if the game already win*/
    func didWin() -> Bool{
        return false
    }
    
    /** First generate the neighbors of a specified row, col item, and return true if the item is equal to any of its neighbor values*/
    func neighbor(row : Int, col : Int, curVal : Int) -> Bool {
        var new : [Int] = []
        let neighbors = [[row - 1, col], [row + 1, col], [row, col - 1], [row, col + 1]]
        for item in neighbors {
            if item[0] >= 0 && item[1] >= 0 && item[0] < boardsize && item[1] < boardsize {
                new.append(self.curBoard[row * boardsize + col])
            }
        }
        
        for item in new {
            if item == curVal {
                return true
            }
        }
        return false
    }
    
    /** Return true if the game already lose*/
    func didLose() -> Bool {
        for item in self.curBoard {
            if item == 0 {
                
                return false
            }
            
        }
        for row in 0..<boardsize {
            for col in 0..<boardsize {
                if neighbor(row: row, col: col, curVal: self.curBoard[row * boardsize + col]) {
                    gameState = true
                    return true
                }
            }
        }
        return false
    }
}
