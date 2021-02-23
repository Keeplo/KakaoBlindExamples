//
//  main.swift
//  Cache(2018/1stRound)
//
//  Created by Yongwoo Marco on 2021/02/23.
//

// 캐시 (1차) 2018 KAKAO BLIND RECRUITMENT

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var time = 0, cache = [String]()
    
    for word in cities {
        let lower = word.lowercased()
        if cache.contains(lower) {
            time += 1
            cache.remove(at: cache.firstIndex(of: lower)!)
            cache.append(lower)
        } else {
            time += 5
            if cacheSize > 0 {
                if cache.count < cacheSize {
                    cache.append(lower)
                } else {
                    cache.removeFirst()
                    cache.append(lower)
                }
            }
        }
    }
    
    return time
}

//let cities = 3
//let cacheSize = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]    // 50
//let cities = 3
//let cacheSize = ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]    // 21
//let cities = 2
//let cacheSize = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]    // 60
//let cities = 5
//let cacheSize = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]    // 52
//let cities = 2
//let cacheSize = ["Jeju", "Pangyo", "NewYork", "newyork"]    // 16
let cities = 1
//let cacheSize = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]    // 25

let cacheSize = ["lost", "lost"]

print(solution(cities, cacheSize))
