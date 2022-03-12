//
//  test.swift
//  CodeTest
//
//  Created by ChanhoHwang on 2021/10/08.
//

import Foundation

//func test() {
//    let num = readLine()!.split(separator: " ").map{Int($0)!}
//
//    let num2 = num[2] - num[0] < num[2] ? num[2] - num[0] : num[2]
//    let num3 = num[3] - num[1] < num[3] ? num[3] - num[1] : num[3]
//
//    print("\(num2 < num3 ? num2 : num3)")
//}
    
func b1085() {
    var num = readLine()!.split(separator: " ").map{Int(String($0))!}

    num[2] = num[2] - num[0]
    num[3] = num[3] - num[1]

    var temp = num[0]

    for i in 0..<num.count {
        if num[i] < temp {
            temp = num[i]
        }
    }

    print("\(temp)")
}
