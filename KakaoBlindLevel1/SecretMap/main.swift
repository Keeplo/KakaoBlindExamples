//
//  main.swift
//  SecretMap
//
//  Created by Yongwoo Marco on 2020/10/16.
//

// 비밀지도 (1차)

// https://programmers.co.kr/learn/courses/30/lessons/17681
// 해설 : https://tech.kakao.com/2017/09/27/kakao-blind-recruitment-round-1/
// 정리 : 

import Foundation

/*
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    let arrA = arr1.map({ (i: Int) -> String in
        var changedNum = String(i, radix: 2)
        while(n-changedNum.count > 0) {
            changedNum = "0" + changedNum
        }
        return changedNum
    })
    let arrB = arr2.map({ (i: Int) -> String in
        var changedNum = String(i, radix: 2)
        while(n-changedNum.count > 0) {
            changedNum = "0" + changedNum
        }
        return changedNum
    })
    for i in 0..<n {
        var midAnswer = [String]()
        for k in 0..<n {
            Array(Array(arrA)[i])[k] == Array(Array(arrB)[i])[k] ? Array(Array(arrA)[i])[k] == "1" ? midAnswer.append("#") : midAnswer.append(" ") : midAnswer.append("#")
        }
        answer.append(midAnswer.reduce("", +))
    }
    
    
    return answer
}
 */

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []

    
    return answer
}

let n = 5
let arr1 = [9, 20, 28, 18, 11]
let arr2 = [30, 1, 21, 17, 28]

print(solution(n, arr1, arr2))
