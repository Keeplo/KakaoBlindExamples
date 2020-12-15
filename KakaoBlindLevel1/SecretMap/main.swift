//
//  main.swift
//  SecretMap
//
//  Created by Yongwoo Marco on 2020/10/16.
//

// 비밀지도 (1차) 2018 Recruitment

// https://programmers.co.kr/learn/courses/30/lessons/17681
// 해설 : https://tech.kakao.com/2017/09/27/kakao-blind-recruitment-round-1/
// 정리 : https://keeplo.tistory.com/159

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    let answer = (0..<n).map{ (i: Int) -> String in
        var data = String(UInt16(arr1[i]) | UInt16(arr2[i]), radix: 2)
        return n-data.count > 0 ? String(repeating: "0", count: n-data.count) + data : data
    }
    
    let result = answer.map({ $0.reduce("") { $1 == "1" ? $0 + "#" : $0 + " " } })
    
    return result
}

// Test 1
let n = 5
let arr1 = [9, 20, 28, 18, 11]
let arr2 = [30, 1, 21, 17, 28]

// Test 2
//let n = 6
//let arr1 = [46, 33, 33 ,22, 31, 50]
//let arr2 = [27 ,56, 19, 14, 14, 10]

print(solution(n, arr1, arr2))


//let a = 4 // 100
//let b = 3 // 11

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
//
//print()
//
//let a = 9 // 1001
//let b = 7 // 111
//
//print(UInt16(a) | UInt16(b))
