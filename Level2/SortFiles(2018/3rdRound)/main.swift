//
//  main.swift
//  SortFiles(2018/3rdRound)
//
//  Created by Yongwoo Marco on 2021/03/04.
//

// 파일명 정렬 (2018 KAKAO BLIND RECRUITMENT 3rd) Lv 2

// https://programmers.co.kr/learn/courses/30/lessons/17686
//

import Foundation

func solution(_ files:[String]) -> [String] {
    // Tokens parsing
    let tokens = files.map({ s -> (String, [String]) in
        var first = [Character](), second = [Character]()
        
        for c in s {
            let cha = Character(extendedGraphemeClusterLiteral: c)
            
            if first.isEmpty {
                first.append(cha)
            } else {
                if !cha.isNumber, second.isEmpty {
                    first.append(cha)
                } else if cha.isNumber, !first.isEmpty {
                    second.append(cha)
                } else if !cha.isNumber, !first.isEmpty, !second.isEmpty {
                    break
                }
            }
        }
        
        return (s, [first.map({String($0)}).joined(), second.map({String($0)}).joined()])
    })
        
    print(tokens)
    
    let sorted = tokens.sorted(by: { (f, l) -> Bool in
           let fArr = f.1
           let lArr = l.1
   
           for (fStr, lStr) in zip(fArr, lArr) {
               if fStr.lowercased() != lStr.lowercased() {
                   if let fi = Int(fStr) {
                       if fi != Int(lStr)! {
                           return fi < Int(lStr)!
                       }
                   } else {
                       return fStr.lowercased() < lStr.lowercased()
                   }
               }
           }
           return false
       }).map{ $0.0 }
        
    return sorted
}

//let files = ["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]
// ["img1.png", "IMG01.GIF", "img02.png", "img2.JPG", "img10.png", "img12.png"]
let files = ["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"]
// ["A-10 Thunderbolt II", "B-50 Superfortress", "F-5 Freedom Fighter", "F-14 Tomcat"]

print(solution(files))

//let a = "ab"
//let b = "abc"
//
//print(a < b)


//let nums = [3, 2, 1, 5, 4]
//
//let sorted = nums.sorted(by: {(f, l) -> Bool in
//    print("------")
//    print(f)
//    print(l)
//    print(" f < l \(f < l)")
//
//
//    return f < l
//})

//print(sorted)
