//
//  main.swift
//  Crane
//
//  Created by Yongwoo Marco on 2020/10/30.
//

// 크레인 인형뽑기 게임 2019 Internship

// https://programmers.co.kr/learn/courses/30/lessons/64061
// https://keeplo.tistory.com/195

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var varB = board
    var stack = [Int]()
    var result = 0

    for i in moves {
        let check = pick(&varB, i)
        
        if check != -1 {
            if check == stack.last {
                stack.popLast()
                result += 1
            } else {
                stack.append(check)
            }
        }
    }

    return result*2
}
func pick(_ board: inout[[Int]], _ index: Int) -> Int {
    for i in 0..<board.count {
        if board[i][index-1] != 0 {
            let tmp = board[i][index-1]
            board[i][index-1] = 0
            return tmp
        }
    }
    return -1
}


let board = [[0,0,0,0,0],
             [0,0,1,0,3],
             [0,2,5,0,1],
             [4,2,4,4,2],
             [3,5,1,3,1]]

let moves = [1,5,3,5,1,2,1,4]

print(solution(board, moves))

// 크레인 좋아요 / 싫어요

