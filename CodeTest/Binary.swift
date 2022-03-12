//
//  Binary.swift
//  CodeTest
//
//  Created by AlexHwang on 2021/12/16.
//

import Foundation

func binary() {
    print(solution2("110010101001"))
}

func solution2(_ s: String) -> [Int] {
    var totalZero = 0
    var splitCount = 0
    var length = "0"
    var result: [String] = []
    
    if s == "1" {
        return [0, 1]
    }
    
    result = split(s)
    
    while Int(length) != 1 {
        length = String(Int(result[1])!, radix: 2)
        totalZero += Int(result[0])!
        
        result = split(length)
        
        splitCount += 1
    }
    
    totalZero += Int(result[0])!
    
    return [splitCount, totalZero]
}

func split(_ s: String) -> [String] {
    var arr = [Character]()
    
    var zeroCount = 0
    var afterZero = 0
    
    for i in s {
        arr.append(i)
    }
    
    for i in arr {
        if i == "0" {
            zeroCount += 1
        } else {
            afterZero += 1
        }
    }
    
    return [String(zeroCount), String(afterZero)]
}
