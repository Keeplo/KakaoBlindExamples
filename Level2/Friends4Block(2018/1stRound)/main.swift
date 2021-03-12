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
    var b = board.map{ $0.map{ (String($0), 0) } }, isMove = true
    let d = [(0, 0), (1, 0), (0, 1), (1, 1)] // y, x
    
    func check(_ arr: inout [[(String, Int)]]) {
        for y in 0..<arr.count {
            for x in 0..<arr.first!.count {
                if y < arr.count - 1, x < arr.first!.count - 1 {
                    if arr[y+1][x].0 == arr[y][x].0, arr[y][x+1].0 == arr[y][x].0, arr[y][x].0 == arr[y+1][x+1].0, arr[y][x].0 != "0" {
                        for (j, i) in d {
                            arr[y+j][x+i].1 += 1
                        }
                    }
                }
            }
        }
//        print("check - - - - - - - - - ")
//        for bb in arr {
//            print(bb)
//        }
        remove(&arr)
    }
    func remove(_ arr: inout [[(String, Int)]]) {
        for y in 0..<arr.count {
            for x in 0..<arr.first!.count {
                if arr[y][x].1 > 0 {
                    arr[y][x] = ("0", 0)
                }
            }
        }
//        print("removed")
//        for bb in arr {
//            print(bb)
//        }
        isMove = false
        move(&arr)
    }
    func move(_ arr: inout [[(String, Int)]]) {
        for x in 0..<arr.first!.count {
            for y in 0..<arr.count-1 {
                if arr[y][x].0 != "0", arr[y+1][x].0 == "0" {
                    isMove = true
                    for z in (1...y+1).reversed() {
                        arr[z][x] = arr[z-1][x]
                        arr[z-1][x] = ("0", 0)
                    }
                }
            }
        }
//        print("move")
//        for bb in arr {
//            print(bb)
//        }
    }
    
    while isMove {
        check(&b)
    }
//
//    for bb in b {
//        print(bb)
//    }
    
    return b.reduce(0, { a, b in
        return a + b.filter({ $0.0 == "0" }).count
    })
}



//let m = 4
//let n = 5
//let board = ["CCBDE", "AAADE", "AAABF", "CCBBF"]   // 14


let m = 6
let n = 6
let board = ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]   // 15


//let m = 2
//let n = 2
//let board = ["TTT", "TTT"]   // 4

print(solution(m, n, board))
