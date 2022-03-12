//
//  1.10_Programmers.swift
//  CodeTest
//
//  Created by AlexHwang on 2022/01/10.
//

// https://programmers.co.kr/learn/courses/30/lessons/49994

import Foundation

struct Point: Equatable {
    var bX = 0
    var bY = 0
    var aX = 0
    var aY = 0
}


func main_0110() {
    print(solution0110("LULLLLLLU"))
}


func solution0110(_ dirs: String) -> Int {
    var wentArr: [Point] = []
    var nowPosition: Point = Point(bX: 0, bY: 0, aX: 0, aY: 0)
    
    let commandArr = dirs.map { $0 }
    
    for item in commandArr {
        switch item {
        case "U":
            if !checkBounds(nowPosition.aX, nowPosition.aY + 1) {
                continue
            }
            
            nowPosition.aY = nowPosition.aY + 1
            
            if checkVisited(wentArr: wentArr, movePosition: nowPosition) {
                wentArr.append(nowPosition)
                nowPosition.bY = nowPosition.bY + 1
            } else {
                nowPosition.bY = nowPosition.bY + 1
                continue
            }
        case "D":
            if !checkBounds(nowPosition.aX, nowPosition.aY - 1) {
                continue
            }
            
            nowPosition.aY = nowPosition.aY - 1
            
            if checkVisited(wentArr: wentArr, movePosition: nowPosition) {
                wentArr.append(nowPosition)
                nowPosition.bY = nowPosition.bY - 1
            } else {
                nowPosition.bY = nowPosition.bY - 1
                continue
            }
        case "L":
            if !checkBounds(nowPosition.aX - 1, nowPosition.aY) {
                continue
            }
            
            nowPosition.aX = nowPosition.aX - 1
            
            if checkVisited(wentArr: wentArr, movePosition: nowPosition) {
                wentArr.append(nowPosition)
                nowPosition.bX = nowPosition.bX - 1
            } else {
                nowPosition.bX = nowPosition.bX - 1
                continue
            }
        case "R":
            if !checkBounds(nowPosition.aX + 1, nowPosition.aY) {
                continue
            }
            
            nowPosition.aX = nowPosition.aX + 1
            
            if checkVisited(wentArr: wentArr, movePosition: nowPosition) {
                wentArr.append(nowPosition)
                nowPosition.bX = nowPosition.bX + 1
            } else {
                nowPosition.bX = nowPosition.bX + 1
                continue
            }
        default:
            return 0
        }
    }
    
    print(wentArr)
    
    return wentArr.count
}

func checkBounds(_ x: Int, _ y: Int) -> Bool {
    let maxDistance = 5
    
    if x.magnitude > maxDistance || y.magnitude > maxDistance {
        return false
    } else {
        return true
    }
}

func checkVisited(wentArr: [Point], movePosition: Point) -> Bool {
    for item in wentArr {
        if item == movePosition || ((item.aX == movePosition.bX) && (item.aY == movePosition.bY) && (item.bX == movePosition.aX) && (item.bY == movePosition.aY)) {
            return false
        }
    }
    return true
}


