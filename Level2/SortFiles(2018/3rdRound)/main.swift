//
//  main.swift
//  SortFiles(2018/3rdRound)
//
//  Created by Yongwoo Marco on 2021/03/04.
//

// 파일명 정렬 (2018 KAKAO BLIND RECRUITMENT 3rd) Lv 2

// https://programmers.co.kr/learn/courses/30/lessons/17686
// https://keeplo.tistory.com/207

import Foundation

func solution(_ files:[String]) -> [String] {
    // Tokens parsing
    let tokens = files.map({ s -> (String, [String]) in
        var head = [Character](), number = [Character]()
        
        for c in s {
            let cha = Character(extendedGraphemeClusterLiteral: c)
            
            if head.isEmpty {
                head.append(cha)
            } else {
                if !cha.isNumber, number.isEmpty {
                    head.append(cha)
                } else if cha.isNumber, !head.isEmpty {
                    number.append(cha)
                } else if !cha.isNumber, !head.isEmpty, !number.isEmpty {
                    break
                }
            }
        }
        
        return (s, [head.map({String($0)}).joined(), number.map({String($0)}).joined()])
    })
        
    print(tokens)
    
    let sorted = tokens.sorted(by: { (a, b) -> Bool in
           let aArr = a.1
           let bArr = b.1
   
           for (aStr, bStr) in zip(aArr, bArr) {
               if aStr.lowercased() != bStr.lowercased() {
                   if let fi = Int(aStr) {
                       if fi != Int(bStr)! {
                           return fi < Int(bStr)!
                       }
                   } else {
                       return aStr.lowercased() < bStr.lowercased()
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


let nums = [3, 2, 1, 5, 4]

let sorted = nums.sorted(by: {(s, f) -> Bool in
    
    print("first: \(f) / second: \(s) // f < s ? \(f<s)")

    return f < s
})

print(sorted)
