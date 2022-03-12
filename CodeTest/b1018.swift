//
//  File.swift
//  CodeTest
//
//  Created by ChanhoHwang on 2021/10/02.
//

import Foundation

func b1018() {
    // 체스판 크기 가로 * 세로
    let horizontal = 8
    let vertical = 8
    
    // 결과를 저장해둘 배열 크기 동적으로 생성
    var resultArr: [Int] = []
    var indexCount: Int = 0
    
    // 공백있는 숫자 입력 받기 (split -> SubString, components -> String) 스트링으로 먼저 변환하고 인트로 바꾸는게 속도적인 측면에서 효율적
    let numArr = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    // 2차원 배열에 입력받은 문자열 저장
    // var fullBoard: [[String]] = [[String]](repeating: Array(readLine()!).map{String($0)}, count: numArr[0])
    
    var fullBoard = [[String]]()
    
    for _ in stride(from: 0, to: numArr[0], by: 1) { // 2차원 배열에 한 줄씩 입력
        fullBoard.append(Array(readLine()!).map{String($0)}) // 공백없는 문자, 숫자( Int() 추가 필요 ) 입력 받기
        // append 보단 += 이 효율적
    }
    
    var tempFullBoard = fullBoard
    
    // index
    var horizontalIndex: Int = 0
    var verticalIndex: Int = 0
    
    // 큰 보드판
    for _ in 0 ..< numArr[0] - vertical + 1 { // 세로
        for _ in 0 ..< numArr[1] - horizontal + 1 { // 가로
            print(" BigBoard i : \(verticalIndex), j : \(horizontalIndex), \(fullBoard[verticalIndex][horizontalIndex])")
            // 작은 보드판
            for i in verticalIndex ..< verticalIndex + 7 { // 가로확인 후 세로 확인
                for j in horizontalIndex ..< horizontalIndex + 7 { // 가로먼저 확인
                    print("In - i : \(i), j : \(j), \(fullBoard[i][j])")
                    
                    if tempFullBoard[i][j] == "B" { // 조건 1 : 시작이 B일 경우
                        if tempFullBoard[i+1][j] == tempFullBoard[i][j] { // 아래가 같을경우
                            print(" AAA \(i+1),\(j) : \(tempFullBoard[i+1][j]), \(i),\(j) : \(tempFullBoard[i][j])")
                            tempFullBoard[i+1][j] = "W"
                            indexCount += 1            // 다시칠해야 하는개수 증가
                        }
                        if tempFullBoard[i][j+1] == tempFullBoard[i][j] { // 오른쪽이 같을경우
                            print(" BBB \(i),\(j+1) : \(tempFullBoard[i][j+1]), \(i),\(j) : \(tempFullBoard[i][j])")
                            tempFullBoard[i][j+1] = "W"
                            indexCount += 1
                        }
                    } else { // 조건 2 : 시작이 W일 경우
                        if tempFullBoard[i+1][j] == tempFullBoard[i][j] { // 아래가 같을경우
                            print(" CCC \(i+1),\(j) : \(tempFullBoard[i+1][j]), \(i),\(j) : \(tempFullBoard[i][j])")
                            tempFullBoard[i+1][j] = "B"
                            indexCount += 1
                        }
                        
                        if tempFullBoard[i][j+1] == tempFullBoard[i][j] { // 오른쪽이 같을경우
                            print(" DDD \(i),\(j+1) : \(tempFullBoard[i][j+1]), \(i),\(j) : \(tempFullBoard[i][j])")
                            tempFullBoard[i][j+1] = "B"
                            indexCount += 1
                        }
                    }
                }
            }
            
            // (n - 1, m - 1) 의 값은 별도로 카운트만
            if tempFullBoard[horizontal - 1][vertical - 2] == tempFullBoard[horizontal - 1][vertical - 1] {
                indexCount += 1
            }
            horizontalIndex += 1 // 작은 보드판 오른쪽으로 한칸이동
            resultArr.append(indexCount) // 배열에 입력
            print(indexCount)
            indexCount = 0            // 카운트 초기화
            tempFullBoard = fullBoard // 보드 초기화
            print("small board end")
        } // 작은 보드판 끝
        verticalIndex += 1  // 작은 보드판 아래로 한칸 이동
        horizontalIndex = 0 // 가로 초기화
        indexCount += 1     // 결과값 저장 위치 이동
    }
    
    // 비교
    print(resultArr.min()!)
}
