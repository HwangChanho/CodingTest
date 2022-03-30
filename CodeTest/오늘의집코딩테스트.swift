//
//  오늘의집코딩테스트.swift
//  CodeTest
//
//  Created by AlexHwang on 2022/03/26.
//

import Foundation

func todayHouse() {
    var arr: [[String]] = [["d", "a", "a", "a"],["c", "a", "a", "a"],["b", "a", "a", "a"]]
    
    print(solution2(arr))
}

func solution2(_ rounds: [[String]]) -> Int {
    var userDic = ["a": "", "b": "", "c": "", "d": ""]
    var matchedDic = ["a": "", "b": "", "c": "", "d": ""]
    let user = ["a", "b", "c", "d"]
    var wrongCnt = 0
    
    for (roundIndex, round) in rounds.enumerated() {
        userDic["a"] = round[0]
        userDic["b"] = round[1]
        userDic["c"] = round[2]
        userDic["d"] = round[3]
        
        for (index, item) in round.enumerated() {
            if user[index] == item {
                print(user[index])
                wrongCnt += 1
                print("111 wrongCnt :", wrongCnt)
            }
            
            if roundIndex > 0 {
                if rounds[roundIndex - 1][index] == rounds[roundIndex][index] && matchedDic[user[index]] == "x" {
                    wrongCnt += 1
                    print("222 wrongCnt :", wrongCnt)
                }
            }
            
            if userDic[item] == user[index] { // 커플 매치 성공
                matchedDic[user[index]] = "x"
                for item in matchedDic {
                    if item.key > user[index] {
                        matchedDic[item.key] = ""
                    }
                }
            }
        }
        
        print(matchedDic)
    }
    
    return wrongCnt
}
