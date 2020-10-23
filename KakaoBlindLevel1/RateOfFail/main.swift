//
//  main.swift
//  RateOfFail
//
//  Created by Yongwoo Marco on 2020/10/19.
//

// 실패율 2019 Recruitment

// https://programmers.co.kr/learn/courses/30/lessons/42889
// 해설 :
// 정리 :


import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var rates = [Double]()
    
    for i in 1...N {
        let triedStageCount = Double(stages.filter({ i<=$0 }).count)
        let failedStageCount = Double(stages.filter({ i==$0 }).count)
        
        var rate = failedStageCount/triedStageCount
        if rate > 1 {
            rate = 1
        }
        
        rates.append(rate)
    }
    
    var result = [Int]()
    for _ in 1...N {
        result.append(rates.firstIndex(of: rates.max()!)! + 1)
        rates[rates.firstIndex(of: rates.max()!)!] = -1
    }
    return result
}

let n = 5
let stages = [2, 1, 2, 6, 2, 4, 3, 3]

print(solution(n, stages))
