//
//  main.swift
//  MaxFormula(2020/InternShip)
//
//  Created by Yongwoo Marco on 2021/03/11.
//

// 수식 최대화 (2020 Kakao Intern) Lv 2

// https://programmers.co.kr/learn/courses/30/lessons/67257
// https://keeplo.tistory.com/205
 
import Foundation

func solution(_ expression:String) -> Int64 {
    let numbers = expression.split(whereSeparator: { !$0.isNumber }).map{ Int64($0)! }
    let operaters = expression.split(whereSeparator: { $0.isNumber }).map{ String($0) }
    var removed = Set(operaters), prioritys = [[String]](), results: Int64 = 0

    func permuteWirth(_ a: [String], _ n: Int) {
        if n == 0 {
            prioritys.append(a)
        } else {
            var a = a
            permuteWirth(a, n - 1)
            for i in 0..<n {
                a.swapAt(i, n)
                permuteWirth(a, n - 1)
                a.swapAt(i, n)
            }
        }
    }
    permuteWirth( Array(removed), removed.count-1)

    for priority in prioritys {
        var cloneNums = numbers, cloneOpers = operaters

        for p in priority {
            while cloneOpers.contains(p) {
                if let index = cloneOpers.firstIndex(of: p) {
                    switch p {
                    case "+":
                        cloneNums[index] += cloneNums[index+1]
                    case "-":
                        cloneNums[index] -= cloneNums[index+1]
                    case "*":
                        cloneNums[index] *= cloneNums[index+1]
                    default:
                        break
                    }
                    cloneNums.remove(at: index+1)
                    cloneOpers.remove(at: index)
                }
            }
        }
//        print(cloneNums.first!)
        if results < abs(cloneNums.first!) {
            results = abs(cloneNums.first!)
        }
    }
    return results
}


//enum Operation: Character {
//    case multiple = "*"
//    case plus = "+"
//    case minus = "-"
//
//    func operate(_ n1: Int64, _ n2: Int64) -> Int64 {
//        switch self {
//            case .multiple: return n1 * n2
//            case .plus: return n1 + n2
//            case .minus: return n1 - n2
//            default: return -1
//        }
//    }
//}


let expression = "100-200*300-500+20"   // 60420
//let expression = "50*6-3*2"             // 300

print(solution(expression))
