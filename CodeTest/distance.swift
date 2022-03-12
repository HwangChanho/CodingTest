//
//  distance.swift
//  CodeTest
//
//  Created by ChanhoHwang on 2021/10/29.
//

import Foundation

func main2() {
    let places = [
        ["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"],
        ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"],
        ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"],
        ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"],
        ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]
    ]
    
    print(solution(places))
}

func search(_ places:[[String]]) -> Bool {
    for x in 0 ..< 5 {
        for y in 0 ..< 5 {
            if places[x][y] == "P" {
                // x, y 가 0보다 작거나, x, y 가 보드 사이즈보다 클떈 스킵
                if !BFS(x, y, places) {
                    print("wrong x: \(x), y: \(y)")
                    return false
                }
            }
        }
    }
    
    return true
}

func BFS(_ x: Int, _ y: Int, _ places: [[String]]) -> Bool {
    typealias Tuple = (x: Int, y: Int, distance: Int)
    // 튜플은 간단한 구조체이다. (Collection)
    let dx = [0, 1, 0, -1]
    let dy = [-1, 0, 1, 0]
    
    var placeTemp = places
    
    var queue: [Tuple] = [(x, y, 0)]
    var cur = 0
    
    // print("before: \(queue)")
    
    while cur < queue.count {
        let position = (x: queue[cur].x, y: queue[cur].y)
        let distance = queue[cur].distance
        cur += 1
        
        placeTemp[x][y] = "X" // 이미 체크한 곳을 x로 만들어 줘야 위에서 걸러진다.
        
        for i in dx.indices { // 컬렉션의 오름차순 index out of range 대신 nil 값을 리턴
            let nx = position.x + dx[i]
            let ny = position.y + dy[i]
            if nx < 0 || nx >= 5 || ny < 0 || ny >= 5 || placeTemp[nx][ny] == "X" {
                continue // 범위를 벗어 났을 경우 & 칸막이가 있는경우
            }
            if placeTemp[nx][ny] == "P" { return false } // P일경우 거리두기를 지키지 않은것!
            placeTemp[nx][ny] = "X" // 이미 체크한 곳을 x로 만들어 줘야 위에서 걸러진다.
            if distance + 1 < 2 {
                queue.append((nx, ny, distance + 1))
                // print("after: \(queue)")
            }
        }
    }
    return true
}

func solution(_ places:[[String]]) -> [Int] {
    let places = places.map{$0.map{$0.map{String($0)}}}
    var result: [Int] = []
    
    for i in 0 ..< places.count {
        print("i: \(i)")
        result.append(search(places[i]) == true ? 1 : 0)
    }
    
    return result
}
