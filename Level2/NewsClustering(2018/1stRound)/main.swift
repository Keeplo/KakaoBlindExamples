//
//  main.swift
//  NewsClustering(2018/1stRound)
//
//  Created by Yongwoo Marco on 2021/02/24.
//

// 뉴스 클러스터링

// https://programmers.co.kr/learn/courses/30/lessons/17677
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    var s1 = [String:Int](), s2 = [String:Int](), intersection = [String:Int]()
    
    for i in 0..<str1.count-1 {
        if Array(str1)[i].isLetter, Array(str1)[i+1].isLetter {
            let two = String(Array(str1)[i...i+1]).lowercased()
            
            if s1.keys.contains(two) {
                s1[two]! += 1
            } else {
                s1.updateValue(1, forKey: two)
            }
        }
    }
    for i in 0..<str2.count-1 {
        if Array(str2)[i].isLetter, Array(str2)[i+1].isLetter {
            let two = String(Array(str2)[i...i+1]).lowercased()
            
            if s2.keys.contains(two) {
                s2[two]! += 1
            } else {
                s2.updateValue(1, forKey: two)
            }
        }
    }
    
    for i in s1 {
        if s2.keys.contains(i.key) {
            let minValue = min(s1[i.key]!, s2[i.key]!)
            intersection.updateValue(minValue, forKey: i.key)
            if i.value > minValue {
                s1[i.key]! -= minValue
                s2.removeValue(forKey: i.key)
            } else {
                s2[i.key]! -= minValue
                s1.removeValue(forKey: i.key)
            }
        }
    }
    
    let union = intersection.reduce(0) { $0+$1.value } + s1.reduce(0) { $0+$1.value } + s2.reduce(0) { $0+$1.value }

    return union == 0 || intersection.isEmpty ? 65536 : Int(Double(intersection.reduce(0) { $0+$1.value })/Double(union)*Double(65536))
}
//
//let str1 = "FRANCE"
//let str2 = "french"    // 16384

let str1 = "handshake"
let str2 = "shake hands"    // 65536

//let str1 = "aa1+aa2"
//let str2 = "AAAA12"    // 43690

//let str1 = "E=M*C^2"
//let str2 = "e=m*c^2"    // 65536

print(solution(str1, str2))


//func solution(_ str1:String, _ str2:String) -> Int {
//    var s1 = [String](), s2 = [String](), intersection = [String]()
//
//    for i in 0..<str1.count-1 {
//        if Array(str1)[i].isLetter, Array(str1)[i+1].isLetter {
//            s1.append( String(Array(str1)[i...i+1]).lowercased() )
//        }
//    }
//    for i in 0..<str2.count-1 {
//        if Array(str2)[i].isLetter, Array(str2)[i+1].isLetter {
//            let str = String(Array(str2)[i...i+1]).lowercased()
//
//            if s1.contains(str) {
//                intersection.append(str)
//                s1.remove(at: s1.firstIndex(of: str)!)
//            } else {
//                s2.append( str )
//            }
//        }
//    }
//
//    let union = intersection + s1 + s2
//
//    return union.isEmpty || intersection.isEmpty ? 65536 : Int(Double(intersection.count)/Double(union.count)*Double(65536))
//}
