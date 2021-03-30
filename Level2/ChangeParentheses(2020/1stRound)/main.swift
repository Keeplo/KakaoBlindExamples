//
//  main.swift
//  ChangeParentheses(2020/1stRound)
//
//  Created by Yongwoo Marco on 2021/03/30.
//

import Foundation

func solution(_ p:String) -> String {
    
    func changeStr(_ u: String) -> String {
        var changed = [String]()
        
        for i in 0..<u.count {
            let s = String( Array(w)[i] )
            
            if let last = chkStack.0.last, String(last) == "(", s == ")" {
                chkStack.0.removeLast()
                chkStack.1 -= 1
            } else {
                if s == "(" {
                    chkStack.1 += 1
                } else {
                    chkStack.2 += 1
                }
                
                chkStack.0.append(s)
            }
        
        if u == "" {
            return ""
        } else if u.count == 2 {
            return "()"
        }
        
        var removedU = u
        removedU.removeFirst()
        removedU.removeLast()
        
        for i in 0..<removedU.count {
            let s = String(Array(removedU)[i])
            
            if s == ")" {
                changed.append("(")
            } else {
                changed.append(")")
            }
            
        }
        
        print(" changeStr : (\(changed.joined()))")
        
        return changeStr(changed.joined())
    }
    func devideStr(_ w: String) -> String {
        var chkStack = ([String](), 0, 0), u = [String]()
        
        if w == "" {
            return ""
        }
        
        for i in 0..<w.count {
            let s = String( Array(w)[i] )
            
            if let last = chkStack.0.last, String(last) == "(", s == ")" {
                chkStack.0.removeLast()
                chkStack.1 -= 1
            } else {
                if s == "(" {
                    chkStack.1 += 1
                } else {
                    chkStack.2 += 1
                }
                
                chkStack.0.append(s)
            }
            
            u.append(s)
            
            if !chkStack.0.isEmpty, chkStack.1 == chkStack.2 {
            
                print(" ( : \(chkStack.1) / ) : \(chkStack.2)  u : \(u.joined()) v: \(String( Array(w)[i+1..<w.count])) ")
                
                return changeStr( u.joined() ) + devideStr( String( Array(w)[i+1..<w.count]) )
            }
        }
        
        return u.joined()
    }
    
    return devideStr(p)
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
