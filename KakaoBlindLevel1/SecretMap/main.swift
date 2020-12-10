//
//  main.swift
//  SecretMap
//
//  Created by Yongwoo Marco on 2020/10/16.
//

// 비밀지도 (1차) 2018 Recruitment

// https://programmers.co.kr/learn/courses/30/lessons/17681
// 해설 : https://tech.kakao.com/2017/09/27/kakao-blind-recruitment-round-1/
// 정리 : 

import Foundation


func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    let arrA = arr1.map({ (i: Int) -> Int in
        var changedNum = String(i, radix: 2)
        while(n-changedNum.count > 0) {
            changedNum = "0" + changedNum
        }
        return Int(changedNum)!
    })
    let arrB = arr2.map({ (i: Int) -> Int in
        var changedNum = String(i, radix: 2)
        while(n-changedNum.count > 0) {
            changedNum = "0" + changedNum
        }
        return Int(changedNum)!
    })
    
    for i in 0..<n {
        answer.append(String(arrA[i]|arrB[i]))
    }
    
    /*
    for i in 0..<n {
        var midAnswer = [String]()
        for k in 0..<n {
            Array(Array(arrA)[i])[k] == Array(Array(arrB)[i])[k] ? Array(Array(arrA)[i])[k] == "1" ? midAnswer.append("#") : midAnswer.append(" ") : midAnswer.append("#")
        }
        answer.append(midAnswer.reduce("", +))
    }
    */
    
    return answer
}

let n = 5
let arr1 = [9, 20, 28, 18, 11]
let arr2 = [30, 1, 21, 17, 28]

print(solution(n, arr1, arr2))


//let a = 21
//let b = 13
//
//let aa = Int8(a)
//let bb = String(b, radix: 2)
//
//
//print(aa)
//print(bb)
//
//
//let aaa = UInt8(bigEndian: UInt8(aa))
//
//print(aaa)
