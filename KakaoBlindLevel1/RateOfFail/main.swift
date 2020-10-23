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
/*
func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var rates = [Int:Double]()
    
    for i in 1...N {
        let triedStageCount = stages.filter({ i<=$0 }).count
        let failedStageCount = stages.filter({ i==$0 }).count
        
        //print("stage: \(i) // try : \(triedStageCount) // fail : \(failedStageCount)")
        
        let rate = Double(failedStageCount)/Double(triedStageCount)
        
        rates.updateValue(rate, forKey: i)
    }

    let result = rates.sorted(by: <).sorted(by: {$0.value > $1.value}).map({$0.key})
    
    return result
}*/

 


func solution(_ n: Int, _ stages: [Int]) -> [Int] {
    var rates = Array(repeating: 0, count: n + 1)

    for stage in stages {
        for i in 0..<stage {
            rates[i] += 1      // stage가 3 이면 stage 1 2 3 을 시도한게 된다.
        }
    }

    var result = [Int:Double]()
    for i in 0..<n {
        result.updateValue(Double(rates[i] - rates[i + 1]) / Double(rates[i]), forKey: i+1)
    }
    return result.sorted(by: <).sorted(by: {$0.value > $1.value}).map({ $0.key })
}


//let n = 5
//let stages = [2, 1, 2, 6, 2, 4, 3, 3]
let n = 4
let stages = [4,4,4,4]

print(solution(n, stages))
