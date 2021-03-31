//
//  main.swift
//  ChangeParentheses(2020/1stRound)
//
//  Created by Yongwoo Marco on 2021/03/30.
//

// 괄호 변환

// https://programmers.co.kr/learn/courses/30/lessons/60058
// https://keeplo.tistory.com/213

import Foundation

func solution(_ p:String) -> String {
    
    func changeDirect(_ u: String) -> String {
        return u.map({ $0 == "(" ? ")" : "("}).joined()
    }
    
    func againFromFirst(_ w: String) -> String {
        var chkPair = ["(": 0, ")": 0], chkStack = [String](), u = "", v = ""
        
        for i in 0..<w.count {
            let s = String(Array(w)[i])
            
            if s == "(" {
                chkPair["("]! += 1
                chkStack.append(s)
            } else {
                if let last = chkStack.last, last == "(" {
                    chkStack.removeLast()
                } else {
                    chkStack.append(s)
                }
                chkPair[")"]! += 1
            }
            
            if chkPair["("] != 0, chkPair["("] == chkPair[")"] { // "균형잡힌 괄호 문자열"
                u = Array(w)[0...i].map({ String($0) }).joined()
                if i+1 <= w.count { // i가 마지막 문자보다 뒤에 있는 경우
                    v = Array(w)[i+1..<w.count].map({ String($0) }).joined()
                }
                
                if chkStack.isEmpty {
                    return u + againFromFirst(v)
                } else {
                    u.removeFirst()
                    u.removeLast()
                    
                    return "(" + againFromFirst(v) + ")" + changeDirect(u)
                }
            }
        }
        return ""
    }
        
    return againFromFirst(p)
}

//let p = "(()())()"      // "(()())()"
//let p = ")("            // "()"
let p = "()))((()"      // "()(())()"

print(solution(p))

//1. 입력이 빈 문자열인 경우, 빈 문자열을 반환합니다.
//2. 문자열 w를 두 "균형잡힌 괄호 문자열" u, v로 분리합니다. 단, u는 "균형잡힌 괄호 문자열"로 더 이상 분리할 수 없어야 하며, v는 빈 문자열이 될 수 있습니다.
//
//3. 문자열 u가 "올바른 괄호 문자열" 이라면 문자열 v에 대해 1단계부터 다시 수행합니다.
//  3-1. 수행한 결과 문자열을 u에 이어 붙인 후 반환합니다.
//
//4. 문자열 u가 "올바른 괄호 문자열"이 아니라면 아래 과정을 수행합니다.
//  4-1. 빈 문자열에 첫 번째 문자로 '('를 붙입니다.
//  4-2. 문자열 v에 대해 1단계부터 재귀적으로 수행한 결과 문자열을 이어 붙입니다.
//  4-3. ')'를 다시 붙입니다.
//  4-4. u의 첫 번째와 마지막 문자를 제거하고, 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙입니다.
//  4-5. 생성된 문자열을 반환합니다.
