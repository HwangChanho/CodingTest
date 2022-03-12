//
//  test.swift
//  CodeTest
//
//  Created by ChanhoHwang on 2021/10/10.
//

import Foundation

func test() {
    
    var fullBoard = [[Int]]()
    let MN = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    for _ in stride(from: 0, to: MN[1], by: 1) { // 2차원 배열에 한 줄씩 입력
        fullBoard.append(Array(readLine()!.split(separator: " ")).map{Int(String($0))!}) // 공백없는 문자, 숫자( Int() 추가 필요 ) 입력 받기
        // append 보단 += 이 효율적
    }
    print()
    print(MN)
    print(fullBoard)
    
    var queue: Array<Any> = []
    var queueIndex: Int = 0
    
    var result = -1
    var temp = 0
    
    let pointX = [0,0,-1,1] // 상하좌우
    let pointY = [-1,1,0,0]

    
    // 시작점 찾기
    for y in 0 ..< MN[1] { // y
        for x in 0 ..< MN[0] { // x
            if fullBoard[y][x] == 1 { // 시작 지점 저장
                queue += [[x,y]]
                print("startpoint : \(queue)")
            }
        }
    }
    
    print(queue[queueIndex])
    
    // queue 가 빌떄까지
    while queue.count != 0 {
        result += 1
        for _ in 0 ..< queue.count {
            print("queue.count :  \(queue.count)")
            let location = queue[queueIndex] as? [Int]
            for i in 0 ..< pointX.count {
                let row = (location?[0])! + pointY[i]
                let col = (location?[1])! + pointX[i]
                print("row : \(row), col : \(col)")
                print("\(MN[1]), \(MN[0])")
                if row < 0 || row > MN[1] - 1 || col > MN[0] - 1 || col < 0 {
                    // x, y 가 0보다 작거나, x, y 가 보드 사이즈보다 클떈 스킵
                    print("skip")
                    continue
                } else {
                    print("in")
                    if fullBoard[row][col] == 0 {
                        fullBoard[row][col] = 1
                        queue += [[row, col]]
                        print(queue)
                        print(fullBoard)
                        print("index : \(queueIndex)")
                    }
                }
            }
            queue.remove(at: temp)
            temp += 0
            queueIndex += 1
        }
    }
    
    
    for row in fullBoard { // 여긴 예외처리부분 0이 없을떄
        if row.contains(0) {
            result = -1
        }
    }
    print(result)
    
    // 0 < x < m, 0 < y < n
    // 1인 좌표 위치 (x,y)
    
}
