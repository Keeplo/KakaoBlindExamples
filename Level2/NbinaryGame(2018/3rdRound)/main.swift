//
//  main.swift
//  NbinaryGame(2018/3rdRound)
//
//  Created by Yongwoo Marco on 2021/03/22.
//

// n진수 게임

// https://programmers.co.kr/learn/courses/30/lessons/17687
// https://keeplo.tistory.com/210

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var table = "", result = ""
    
    for i in 0...t*m {
        table += String(i, radix: n, uppercase: true)
    }

    for i in 0...t*m {
        if i%m == p-1 {
            result += String(table[table.index(table.startIndex, offsetBy: i)])
            if result.count == t {
                break
            }
        }
    }
    
    return result
}

//let n = 16
//let t = 4
//let m = 2
//let p = 1
////"0111"

//let n = 16
//let t = 16
//let m = 2
//let p = 1
////"02468ACE11111111"
//
let n = 16
let t = 16
let m = 2
let p = 2

//"13579BDF01234567"

print(solution(n, t, m, p))
