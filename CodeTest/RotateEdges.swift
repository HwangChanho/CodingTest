//
//  RotateEdges.swift
//  CodeTest
//
//  Created by ChanhoHwang on 2021/12/09.
//

import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    //가장 작은 숫자들을 담을 배열
    var answer:[Int] = []
    //직사각형 숫자들을 담을 배열
    var rectangle:[[Int]] = makeRectangle(rows: rows, columns: columns)
    //회전된 직사각형 숫자들을 담을 배열
    var newRectangle:[[Int]] = rectangle
    
    
    
    return []
}

func makeRectangle(rows:Int,columns:Int) -> [[Int]]{
    //직사각형을 담을 배열
    var rectangle:[[Int]] = []
    //열 숫자만큼 행의 숫자들을 넣어줌.
    for row in 0..<rows {
        let col = (1+(columns*row)...(columns*(row+1))).map{$0} // 배열에 담기
        rectangle.append(col)
    }
    //만들어진 직사각형을 반환
    return rectangle
}
