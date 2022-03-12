//
//  b2475.swift
//  CodeTest
//
//  Created by ChanhoHwang on 2021/09/30.
//

import Foundation

//MARK: - test
func b2475() {
    let uniqueNumCnt = 5
    var uniqueNum: [Int] = []
    var verificationNum: Int = 0
    
    if let text = readLine() {
        for i in 0..<uniqueNumCnt {
            uniqueNum.append(Int(text.split(separator: " ")[i])!)
            
            verificationNum += uniqueNum[i] * uniqueNum[i]
        }
        
        uniqueNum.append(verificationNum % 10)
        print(verificationNum % 10)
    }
    
    //MARK: - Solution
    
    // foreach + 고차함수 study
    
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! * Int(String($0))!}
    
    print(input.reduce(0, +) % 10)
}
