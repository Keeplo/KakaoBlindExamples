//
//  main.swift
//  MaxFormula(2020/Intern)
//
//  Created by Yongwoo Marco on 2021/02/26.
//

// 수식 최대화 (2020 Kakao Intern) Lv 2

// https://programmers.co.kr/learn/courses/30/lessons/67257
// 
 
import Foundation

func solution(_ expression:String) -> Int64 {
    let numbers = expression.split(whereSeparator: { !$0.isNumber }).map{ Int($0)! }
    let operaters = expression.split(whereSeparator: { $0.isNumber }).map{ String($0) }
    var removed = Set(operaters)
    var prioritys = [[String]]()
    
//    print(numbers)
//    print(operaters)
//    print(removed)
    
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
    
    for operater in prioritys {
        for o in operater {
            for i in 0..<operaters.count {
                if operaters[i] == o {
                    
                } else {
                    
                }
            }
        }
    }
    
    
    return 0
}





let expression = "100-200*300-500+20"   // 60420
//let expression = "50*6-3*2"             // 300

print(solution(expression))
