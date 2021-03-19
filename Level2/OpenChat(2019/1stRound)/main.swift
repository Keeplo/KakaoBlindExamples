//
//  main.swift
//  OpenChat(2019/1stRound)
//
//  Created by Yongwoo Marco on 2021/03/19.
//

// 오픈채팅방 (2019 KAKAO BLIND RECRUITMENT 1st) Lv 2

// https://programmers.co.kr/learn/courses/30/lessons/42888
//

import Foundation

func solution(_ record:[String]) -> [String] {
    var users = [String:String](), commands = [(String, String)]()
    
    for log in record {
        let datas = log.components(separatedBy: " ")
        
        if datas[0] != "Leave" {
            users.updateValue(datas[2], forKey: datas[1])
            commands.append((datas[0], datas[1]))
        } else {
            if datas[0] == "change" {
                users[ datas[1] ] = datas[2]
            }
            commands.append((datas[0], datas[1]))
        }
    }
    
    return commands.compactMap({ command -> String? in
        if command.0 == "Enter" {
            return "\(users[command.1]!)님이 들어왔습니다."
        } else if command.0 == "Leave" {
            return "\(users[command.1]!)님이 나갔습니다."
        } else {
            return nil
        }
    })
}

let record = ["Enter uid1234 Muzi", "Enter uid4567 Prodo", "Leave uid1234", "Enter uid1234 Prodo", "Change uid4567 Ryan"]

print(solution(record))
