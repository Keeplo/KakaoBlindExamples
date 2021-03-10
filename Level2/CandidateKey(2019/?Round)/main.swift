//
//  main.swift
//  CandidateKey(2019/?Round)
//
//  Created by Yongwoo Marco on 2021/03/10.
//

// 후보키 (2018 KAKAO BLIND RECRUITMENT) Lv 2

import Foundation

func solution(_ relation:[[String]]) -> Int {
    var countOfKeys = 0, exceptIndex = [[Int]]()
    let columm = relation[0].count, row = relation.count
    
    func combination(total: [Int], shouldSelect: Int, current index: Int, selected: [Int]) {
        if shouldSelect == 0 {
            if exceptIndex.filter({ i -> Bool in
                // 후보키로 사용중인 인덱스 묶음이 포함되었나 확인
                // 인덱스 묶음의 데이터 모두 filter(true)로 나온 수와 인덱스 묶음의 총 갯수 같으면 묶음이 포함됨
                return i.filter({ selected.contains($0) }).count == i.count
            }).count == 0 { // 포함된경우 count > 0
                check(selected)
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
    
    func check(_ indexes: [Int]) {
        var arrs = [[String]]()
        var joinKeys = [String]()
        
        for i in indexes {  // i번째 속성의 rows 추가
            arrs.append(relation.map({ $0[i] }))
        }
        for i in 0..<arrs[0].count {    // 각 속성들의 i번째 row 들을 하나의 문자열로 묶음
            joinKeys.append( arrs.map({ $0[i] }).joined() )
        }
        
        if row == Set(joinKeys).count { // 중복 데이터 있음
            exceptIndex.append(indexes) // indexes 묶음이 후보키로 사용되는 경우 추가됨
            countOfKeys += 1
        }
    }
    
    for select in 1...columm {
        combination(total: Array(0..<columm), shouldSelect: select, current: 0, selected: [])
    }
    
    return countOfKeys
}

let relation = [["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]
// 2

print(solution(relation))
