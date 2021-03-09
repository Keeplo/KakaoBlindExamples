//
//  main.swift
//  RenewMenu(2021/1stRound)
//
//  Created by Yongwoo Marco on 2021/03/08.
//

// 메뉴 리뉴얼 (2021 KAKAO BLIND RECRUITMENT 1st) Lv 2

// https://programmers.co.kr/learn/courses/30/lessons/72411
//

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var combo = [String:Int](), result = [String]()
    let eachOrders = orders.map({ $0.map({ String($0) }) })

//    print(eachOrders)
//    print(dishs)

    
    func combination(total: [String], shouldSelect: Int, current index: Int, selected: [String]) {
        if shouldSelect == 0 {
            print(selected)
            let sel = selected.sorted(by: <).joined()  // 확인 할 코스
            
            if !combo.keys.contains( sel ) {
                let ordered = eachOrders.filter({ o -> Bool in  // 해당 주문 한 경우 손님의 수
                    if o.count >= selected.count {
                        
                        for c in selected {
                            if !o.contains(c) {
                                return false
                            }
                        }
                        
                        return true
                        
                    } else {
                        return false
                    }
                }).count
                
                if ordered >= 2 {
                    print("is ")
                    combo.updateValue(ordered, forKey: sel)
                }
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
        
        if let max = combo.values.max() {
            result += combo.filter({ $0.value == max }).keys
        }
        
        combo.removeAll()
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
