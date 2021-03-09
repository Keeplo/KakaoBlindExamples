//
//  main.swift
//  RenewMenu(2021/1stRound)
//
//  Created by Yongwoo Marco on 2021/03/08.
//

// 메뉴 리뉴얼 (2021 KAKAO BLIND RECRUITMENT 1st) Lv 2

// https://programmers.co.kr/learn/courses/30/lessons/72411
// https://keeplo.tistory.com/201

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var combos = [String:Int](), result = [String]()
    let eachOrders = orders.map({ $0.map({ String($0) }) })
    
    func combination(total: [String], shouldSelect: Int, current index: Int, selected: [String]) {
        if shouldSelect == 0 {
            let sorted = selected.sorted(by: <).joined()
            if combos.keys.contains(sorted) {
                combos[sorted]! += 1
            } else {
                combos.updateValue(1, forKey: sorted)
            }
        } else if index == total.count {
            return
        } else {
            var newSelected = selected
            newSelected.append( total[index] )
            combination(total: total, shouldSelect: shouldSelect-1, current: index+1, selected: newSelected)
            combination(total: total, shouldSelect: shouldSelect, current: index+1, selected: selected)
        }
    }
    
    for numOfDishs in course {
        for order in eachOrders {
            if order.count >= numOfDishs {
                combination(total: order, shouldSelect: numOfDishs, current: 0, selected: [])
            }
        }
        
        combos = combos.filter({ $0.value > 1 })
        
        if let max = combos.values.max() {
            result += combos.filter({ $0.value == max }).keys
        }
        
        combos.removeAll()
    }

    return result.sorted(by: <)
}

let orders = ["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"]
let course = [2,3,4]    //["AC", "ACDE", "BCFG", "CDE"]

//let orders = ["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"]
//let course = [2,3,5]    //["ACD", "AD", "ADE", "CD", "XYZ"]

//let orders = ["XYZ", "XWY", "WXA"]
//let course = [2,3,4]    //["WX", "XY"]

print(solution(orders, course))
