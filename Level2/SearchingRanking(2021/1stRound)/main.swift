//
//  main.swift
//  SearchingRanking(2021/1stRound)
//
//  Created by Yongwoo Marco on 2021/02/25.
//

//

//
//

import Foundation

//func solution(_ info:[String], _ query:[String]) -> [Int] {
//
//    let list = info.map{ str -> [String] in
//        return str.components(separatedBy: " ")
//    }
//    let querys = query.map{ str -> [String] in
//        return str.components(separatedBy: " ").filter{ $0 != "and" }
//    }
//
//    let result = querys.map{ q -> Int in
//        var count = 0
//
//        for i in 0..<list.count {
//            for j in 0..<q.count {
//                if j < q.count-1, list[i][j] != q[j] && q[j] != "-" {
//                    break
//                } else if j == q.count-1, Int(list[i][j])! >= Int(q[j])! {
//                    count += 1
//                }
//            }
//        }
//
//        return count
//    }
//
//    return result
//}

func solution(_ info:[String], _ query:[String]) -> [Int] {

    let list = info.map{ str -> (String, Int) in
        let components = str.components(separatedBy: " ")
        
        return (components[0..<components.count-1].joined(), Int(components.last!)!)
    }
    
    let q = query.map{ str -> [String] in
        return str.components(separatedBy: "-").map{ $0.components(separatedBy: " ").filter{ $0 != "and" && Int($0) == nil }.joined() }.filter{ $0 != "" }
    }
    
    let scores = query.map{ str -> [String] in
        return str.components(separatedBy: "-").map{ $0.components(separatedBy: " ").filter{ $0 != "and" && Int($0) != nil }.joined() }.filter{ $0 != "" }
    }
    
    print(list)
    print(q)
    print(scores)

//    let result = querys.map{ q -> Int in
//        var count = 0, mlist = list
//
//
//
//
//
//        return count
//    }

    return []
}

let info = ["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"]
let query = ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]    // [1,1,1,1,2,4]


print(solution(info, query))
