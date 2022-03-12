//
//  b9095.swift
//  CodeTest
//
//  Created by ChanhoHwang on 2021/10/22.
//

import Foundation

func b9095() {
    var num = Int(readLine()!)

    var dp = [Int](repeating: 0, count: 12)

    dp[1] = 1
    dp[2] = 2
    dp[3] = 4

    for i in 4..<12
    {
        dp[i] = dp[i-3]+dp[i-2]+dp[i-1]
    }

    for _ in 0..<num!
    {
        let n = Int(readLine()!)
        print(dp[n!])
    }
}
