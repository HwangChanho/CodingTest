//
//  81303.swift
//  CodeTest
//
//  Created by AlexHwang on 2022/03/22.
//

import Foundation

enum Actions: String { // saved in Stack
    case down = "D"
    case up = "U"
    case delete = "C"
    case undo = "Z"
}

func p81303() {
    print(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"]))
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    // n: 처음 표의 행 개수
    // k: 처음 선택된 행의 위치를 나타내는 정수
    var maxCount = n // 현재 셀개수
    var workingArr: [Int] = Array(0..<n)
    var resultArr: [Int] = Array(0..<n)
    
    var nowPosition: Int = k + 1 // 현제 선택중인 셀
    var resentlyDeleted: [Int] = [] // 최근에 지워진 셀
    
    for num in cmd {
        let data = num.split(separator: " ")
        let action = Actions(rawValue: String(data[0]))
        
        switch action {
        case .down:
            print("\ndown :", Int(String(data[1]))!)
            nowPosition += Int(String(data[1]))!
            print("nowPositon: ", nowPosition)
            print("workingArr: ", workingArr)
        case .up:
            print("\nup: ", Int(String(data[1]))!)
            nowPosition -= Int(String(data[1]))!
            print("nowPositon: ", nowPosition)
            print("workingArr: ", workingArr)
        case .delete:
            print("\ndelete")
            if nowPosition == maxCount {
                print("maxCount: ", maxCount)
                maxCount -= 1
                resentlyDeleted.append(workingArr[nowPosition - 1])
                workingArr.remove(at: nowPosition - 1)
                nowPosition -= 1
            } else {
                maxCount -= 1
                resentlyDeleted.append(workingArr[nowPosition - 1])
                workingArr.remove(at: nowPosition - 1)
            }
            print("resentlyDeleted: ", resentlyDeleted)
            print("delete: ", workingArr)
            print("nowPositon: ", nowPosition, workingArr[nowPosition - 1])
        case .undo:
            print("\nundo")
            print("undo: ", workingArr)
            print("resentlyDeleted: ", resentlyDeleted)
            print("nowPositon: ", nowPosition, workingArr[nowPosition - 1])
            maxCount += 1
            let undoIndex = resentlyDeleted.last!
            
            workingArr.append(undoIndex)
            resentlyDeleted.removeLast()
            workingArr = workingArr.sorted()
            
            if undoIndex < nowPosition {
                nowPosition += 1
            }
            
            print("resentlyDeleted: ", resentlyDeleted)
            print("undo: ", workingArr)
            print("nowPositon: ", nowPosition, workingArr[nowPosition - 1])
        default:
            print("fetalError")
        }
    }
    
    print("workingArr: ", workingArr)
    print("resultArr: ", resultArr)
    
    return resultArr.map { workingArr.contains($0) ? "O" : "X" }.joined()
}


