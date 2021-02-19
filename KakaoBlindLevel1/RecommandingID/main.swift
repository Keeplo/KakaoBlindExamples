//
//  main.swift
//  RecommandingID
//
//  Created by Yongwoo Marco on 2021/02/19.
//

import Foundation

// 신규 아이디 추천 (2021 1차)

// https://programmers.co.kr/learn/courses/30/lessons/72410
// https://keeplo.tistory.com/187
// 해설 : https://tech.kakao.com/2021/01/25/2021-kakao-recruitment-round-1/

func solution(_ new_id:String) -> String {
    var tmp = [Character](), arr = new_id.map({ Character($0.lowercased()) }) // 1단계
    print(arr)
    
    // 2단계
    arr = arr.filter{  $0.isLetter || $0.isNumber || $0 == "-" || $0 == "_" || $0 == "." }
    print(arr)
    // 3단계
    for i in arr {
        if tmp.last == "." && tmp.last == i {
            
        } else {
            tmp.append(i)
        }
    }
    arr = tmp
    print(arr)
    // 4단계
    arr = arr.map{ String($0) }.joined().trimmingCharacters(in: ["."]).map{ Character(extendedGraphemeClusterLiteral: $0) }
    print(arr)
    // 5단계
    arr = arr.count == 0 ? ["a"] : arr
    print(arr)
    // 6단계
    arr = arr.count > 15 ? Array(arr[0..<15]) : arr
    if arr.last == "." {
        arr.removeLast()
    }
    print(arr)
    // 7단계
    while !arr.isEmpty && arr.count < 3 {
        arr.append(arr.last!)
    }
    
    return arr.map{ String($0) }.joined()
}

let new_id = "...!@BaT#*..y.abcdefghijklm"  //"bat.y.abcdefghi"
//let new_id = "z-+.^."                       //"z--"
//let new_id = "=.="                          //"aaa"
//let new_id = "123_.def"                     //"123_.def"
//let new_id = "abcdefghijklmn.p"             //"abcdefghijklmn"

print(solution(new_id))

//1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
//2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
//3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
//4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
//5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
//6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
//     만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.

//7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.

