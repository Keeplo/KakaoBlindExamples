//
//  main.swift
//  Budget
//
//  Created by Yongwoo Marco on 2021/01/08.
//  Copyright © 2021 Yongwoo Marco Kim. All rights reserved.
//

// 예산 2018 Summer/Winter Coding

// https://programmers.co.kr/learn/courses/30/lessons/12982
// https://keeplo.tistory.com/164

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var b = budget
    
    return d.sorted().filter({
        b -= $0
        return b >= 0
    }).count
}

//let d = [1,3,2,5,4]
let d = [2,2,3,3]

//let b = 9
let b = 10

print(solution(d, b))
