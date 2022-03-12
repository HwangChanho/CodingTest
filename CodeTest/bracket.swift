//
//   bracket.swift
//  CodeTest
//
//  Created by ChanhoHwang on 2021/11/09.
//

import Foundation

func main() {
    //print(solution("()))((()"))
}

func solution(_ p:String) -> String {
    if p.isEmpty { return "" }
    
    let stringArray = Array(p)
    let UV = stringArray.makeUV()
    var (U, V) = (UV.0, UV.1)
    let vString = V.toString
    
    print("쪼개기: \((U, V))")
    
    if U.isValidBrace {
        print("isValidTrue: \(U.toString + solution(vString))")
        return U.toString + solution(vString)
    } else {
        var answer: String = "(" + solution(vString) + ")"
        U.removeFirst()
        U.removeLast()
        answer += U.map { $0 == "(" ? ")" : "(" }.toString
        return answer
    }
}

extension Array where Element == Character {
    var toString: String { // char type 배열을 string 타입으로 변경할때 사용
        return map { String($0) }.joined()
    }
    
    var isValidBrace: Bool {
        var stackCount: Int = 0
        for char in self {
            if char == "(" {
                stackCount += 1
            } else {
                if stackCount > 0 { stackCount -= 1 }
                else { return false }
            }
        }
        return stackCount == 0 ? true : false
    }
    
    func makeUV() -> ([Character], [Character]) {
        var leftCount: Int = 0
        var rightCount: Int = 0
        
        for char in self {
            if char == "(" { leftCount += 1 }
            else { rightCount += 1 }
            if leftCount == rightCount { break }
        }
        
        let U = Array(self[..<(leftCount + rightCount)])
        let V = (leftCount + rightCount) == count ? [] : Array(self[(leftCount + rightCount)...])
        return (U, V)
    }
}



