//
//  main.swift
//  RightBeforeSong(2018/3rdRound)
//
//  Created by Yongwoo Marco on 2021/03/22.
//

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    let infos = musicinfos.map({ $0.components(separatedBy: ",") })
    var corrects = [(String, String)]()

    for info in infos {
        let fomatter = DateFormatter()
        fomatter.dateFormat = "HH:mm"

        guard let startTime = fomatter.date(from: info[0] ) else { return "" }
        guard let finishTime = fomatter.date(from: info[1] ) else { return "" }

        let playTime = Int(finishTime.timeIntervalSince(startTime)) / 60

        var repeatCode = [String]()
        var musicCode = ""

        for i in 0..<info[3].count {
            if i < info[3].count - 1, Array(info[3])[i+1] == "#" {
                repeatCode.append( String(Array(info[3])[i]) + "#" )
            } else if Array(info[3])[i] != "#" {
                repeatCode.append( String(Array(info[3])[i]) )
            }
        }
        print("-----------------------------")
        print(repeatCode)
        print("playTime \(playTime) / \(playTime/repeatCode.count) % \(playTime%repeatCode.count)")

        for _ in 0..<playTime/repeatCode.count {
            musicCode += repeatCode.joined()
        }

        if playTime%repeatCode.count > 0 {
//            print("% \(playTime%60) \(m.prefix(playTime%60))")
            musicCode += repeatCode.prefix(playTime%repeatCode.count).joined()
        }

        print(m)
        print(musicCode)
        
        if musicCode.contains(m), !musicCode.contains(String(m+"#")) {
            corrects.append((info[2], musicCode))
        }
    }
    
    print(corrects)
    
    if corrects.isEmpty {
        return "(None)"
    } else {
        return corrects.sorted(by: {$0.1.count > $1.1.count }).first!.0
    }
}



//let m = "ABCDEFG"
//let musicinfos = ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]
//"HELLO"

//let m = "CC#BCC#BCC#BCC#B"
//let musicinfos = ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"]
////"FOO"

//let m = "ABC"
//let musicinfos = ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"]
////"WORLD"

let m = "ABC"
let musicinfos = ["12:00,12:14,HELLO,ABCD", "13:00,13:03,WORLD,ABCDE"]

print(solution(m, musicinfos))
