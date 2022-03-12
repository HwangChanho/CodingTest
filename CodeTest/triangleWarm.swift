//
//  triangleWarm.swift
//  CodeTest
//
//  Created by AlexHwang on 2021/12/13.
//

import Foundation

func triangleWarm() {
    solution(5)
}

func solution(_ n:Int) -> [Int] {
    enum Direction {
        case down
        case right
        case up
    }
    
    var direction: Direction = .down // 진행방향을 저장할 변수. down부터 시작해준다.
    var array: [[Int]] = [] // 달팽이 채우기를 진행할 배열
    var sum = 0 // 총 숫자의 개수
    var oneline = n - 1 == 0 ? 1 : n - 1 // 각 방향당 저장할 숫자의 개수
    var count = 1 // 저장할 숫자
    var value = 0 // 1바퀴 돌때마다 +1씩 해준다
    var result: [Int] = [] // 최종 결과값을 저장할 배열
    
    // 값을 순서대로 저장할 배열을 만들고 0으로 초기화 해준다. 또한 총 숫자의 개수를 구해준다
    for i in 0..<n {
        array.append([Int](repeating: 0, count: i+1))
        sum += i + 1
    }
    
    // 각 방향별로 배열에 값을 채워준다
    repeat {
        switch direction {
        case .down:
            for i in 0 ..< oneline {
                array[i + (value * 2)][value] = count
                count += 1
            }
            direction = .right
            
        case .right:
            for i in 0 ..< oneline {
                array[n - 1 - value][i + value] = count
                count += 1
            }
            direction = .up
            
        case .up:
            for i in value ..< oneline+value {
                array[n - 1 - i][n - 1 - i - value] = count
                count += 1
            }
            direction = .down
            oneline = oneline - 3 == 0 ? 1 : oneline - 3
            value += 1
        }
    } while count <= sum // count가 sum보다 크거나 같을 때까지 반복한다
    
    //print(array)
    
    // 2중 배열에 담긴 값들을 배열에 담아 준다
    for arr in array {
        for i in arr {
            result.append(i)
        }
    }
    
    //print(result)
    
    return result
}
