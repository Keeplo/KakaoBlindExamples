//
//  main.swift
//  CompressingStr(2020)
//
//  Created by Yongwoo Marco on 2021/03/01.
//

// 문자열 압축 (2020 KAKAO BLIND RECRUITMENT) Lv 2 

// https://programmers.co.kr/learn/courses/30/lessons/60057
// 

import Foundation

func solution(_ s:String) -> Int {
    if s.count == 1 { return 1 }
    var lenghs = [Int](repeating: 0, count: s.count/2+1), str = s, stack = [String]()
    
    lenghs[0] = s.count
    
    for i in 1...s.count/2 {
        print("i \(i)")
        var q = str
        var result = ""
        while q.count > 0 {
            let range = q.startIndex..<q.index(q.startIndex, offsetBy: i)
            
            if let last = stack.last, last != String(q[range]) {
                print("last \(last), q \(q[range])")
                
                if stack.count > 1 {
                    result.append("\(stack.count)\(stack.last!)")
                    stack.removeAll()
                } else {
                    result.append("\( String(stack.last![stack.last!.startIndex..<stack.last!.index(stack.last!.startIndex, offsetBy: i)]) )")
                    q = String(stack.last![stack.last!.index(stack.last!.startIndex, offsetBy: i)..<stack.last!.endIndex]) + q
                    stack.removeAll()
                }
            } else {
                stack.append( String(q[range]) )
                q.removeFirst(i)
            }
        }
        if stack.count > 0 {
            result.append("\(stack.count)\(stack.last!)")
            stack.removeAll()
        }
        print(result)
        lenghs[i] = result.count
    }
    
    return lenghs.min()!
}

let s = "aabbaccc"                      //7
//let s = "ababcdcdababcdcd"              // 9
//let s = "abcabcdede"                    // 8
//let s = "abcabcabcabcdededededede"      // 14
//let s = "xababcdcdababcdcd"             // 17

print(solution(s))
