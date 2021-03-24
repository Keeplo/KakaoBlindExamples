//
//  main.swift
//  Tuple(2019/Intern)
//
//  Created by Yongwoo Marco on 2021/03/24.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var result = [Int]()
    
    let queue = s.components(separatedBy: ["{", "}"]).filter({ $0 != "" }).filter({ $0 != "," }).map({ $0.components(separatedBy: ",").map({ Int($0)! }) }).sorted(by: { $0.count < $1.count })
            
    for i in 0..<queue.count {
        var checker = true
        
        for j in i..<queue.count {
            if !checkContain(queue[i], queue[j]) {
                checker = false
                break
            }
        }
        
        if checker {
            _ = queue[i].map({ num in
                if !result.contains(num) {
                    result.append(num)
                }
            })
        }
    }
    
    return result
}

func checkContain(_ checkArr: [Int], _ baseArr: [Int]) -> Bool {
    return checkArr.filter({ baseArr.contains($0) }).count == checkArr.count
}

//let s = "{{2},{2,1},{2,1,3},{2,1,3,4}}"    //   [2, 1, 3, 4]
//let s = "{{1,2,3},{2,1},{1,2,4,3},{2}}"    //   [2, 1, 3, 4]
//let s = "{{20,111},{111}}"                 //   [111, 20]
//let s = "{{123}}"                          //   [123]
let s = "{{4,2,3},{3},{2,3,4,1},{2,3}}"    //   [3, 2, 4, 1]

print(solution(s))
