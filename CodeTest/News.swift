//
//  News.swift.swift
//  CodeTest
//
//  Created by ChanhoHwang on 2021/11/15.
//

import Foundation

// 자카드 유사도 = 교집합 수 / 합집합 수

func news() {
    print(solution("FRANCE", "french"))
    print(solution("aa1+aa 2", "AAAA12"))
    print(solution("E=M*C^2", "e=m*c^2"))
    print(solution("#$#$#$", "e=m*c^2"))
    print(solution("aa1+aa2", "AAAA12"))
}

func solution(_ str1: String, _ str2: String) -> Int {
    // 문자열 자르기
    var str1Arr: [String] = []
    var str2Arr: [String] = []
    
    str1Arr = str1.map({ char in
        if char.isLetter {
            return String(char).lowercased().trimmingCharacters(in: .whitespaces)
        }
        else {
            return ""
        }
    })
    
    str2Arr = str2.map({ char in
        if char.isLetter {
            return String(char).lowercased().trimmingCharacters(in: .whitespaces)
        }
        else {
            return ""
        }
    })
    
    //print(str1Arr, str2Arr)
    
    var tempArr: [String] = []
    
    for i in 0 ..< str1Arr.count - 1 {
        if str1Arr[i] != "" && str1Arr[i+1] != "" {
            tempArr.append(str1Arr[i] + str1Arr[i+1])
        } else {
            continue
        }
    }
    print("1 :" ,tempArr)
    str1Arr = tempArr
    
    tempArr = []
    for i in 0 ..< str2Arr.count - 1 {
        if str2Arr[i] != "" && str2Arr[i+1] != "" {
            tempArr.append(str2Arr[i] + str2Arr[i+1])
        } else {
            continue
        }
    }
    print("2 :" ,tempArr)
    str2Arr = tempArr
    
    return count(str1: str1Arr, str2: str2Arr)
}

func count(str1: [String], str2: [String]) -> Int {
    let set = Set(str1)
    print("set :", set)
    let set2 = Set(str2)
    print("set2 :", set2)
    
    if set.isEmpty || set2.isEmpty {
        return 65536
    }
    
    let intersections = set.intersection(set2).count
    let union = set.union(set2).count
    
    let result = Int(Double(intersections) / Double(union) * 65536)
    print(result)
    
    return result
}
