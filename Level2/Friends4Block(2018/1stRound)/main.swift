//
//  main.swift
//  Friends4Block(2018/1stRound)
//
//  Created by Yongwoo Marco on 2021/03/01.
//

// 프렌즈4블록 (2018 KAKAO BLIND RECRUITMENT 1st) Lv 2

// https://programmers.co.kr/learn/courses/30/lessons/60057
//

import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var b = board.map{ $0.map{ (String($0), 0) } }
    let d = [(0, 0), (1, 0), (0, 1), (1, 1)]
        
    print(b)
    
    func check(_ x: Int,_ y: Int) {
        print("x \(x) y \(y)")
        if x < m-1, y < n-1 {
            // 맵 내부
            check(x+1, y)
            check(x, y+1)
            
            if b[y][x].0 == b[y+1][x].0, b[y][x].0 == b[y][x+1].0, b[y][x].0 == b[y+1][x+1].0 {
                for i in d {
                    b[y+i.0][x+i.1].1 += 1
                }
            }
        } else {
            // 맵 외부
        }
       
        
        if x == 0, y == 0 {
            remove()
            move()
        }
    }
    
    func move() {
        for y in 0..<b.count {
            for x in 0..<b[0].count {
                if y < b.count - 1 {
                    if b[y+1][x].0 == "1" {
                        b[y+1][x] = b[y][x]
                        b[y][x].0 = "0"
                    }
                }
            }
        }
    }
    func remove() {
        for y in 0..<b.count {
            for x in 0..<b[0].count {
                if y < b.count - 1 {
                    if b[y+1][x].1 > 0 {
                        b[y+1][x].0 = "1"
                    }
                }
            }
        }
    }

    check(0, 0)
    
    return b.reduce(0){ $0 + $1.filter{ $0.0 == "0" }.count }
}



let m = 4
let n = 5
let board = ["CCBDE", "AA1DE", "AA1BF", "CC1BF"]   // 14
//let board = ["CCBDE", "AAADE", "AAABF", "CCBBF"]   // 14


//let m = 6
//let n = 6
//let borad = ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]   // 15

print(solution(m, n, board))
