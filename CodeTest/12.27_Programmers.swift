//
//  12.27_Programmers.swift
//  CodeTest
//
//  Created by AlexHwang on 2021/12/27.
//

import Foundation

/*
 x보다 크고 x와 비트가 1~2개 다른 수들 중에서 제일 작은 수
 */

func main_1227() {
    print(solution([3, 7]))
}

func solution(_ numbers:[Int64]) -> [Int64] {
    numbers.map {
        if ($0 % 2) == 0 {  // 짝수일 경우에는 0이 마지막 자리라 1로만 바꿔주면 최소값 조건 충족
            return $0 + 1
        } else {            // 홀수일 경우 가장 끝자리의 0을 1로 바꾸고 그다음에 있는 1을 0으로 바꾸면된다 (커야하기 떄문에)
            let lowerstByte = (~$0) & ($0 + 1) // 왼쪽부터 바꿀 가장 작은 0을 찾기위해 역수와 하나큰수에 and 연산을 해주면 해당 자리가 1로됨 (가장끝자리의 0의 정보를 1로변환하여 가지고 있는상태 ex) 3(11) 4(100) -> 100 & 100 = 100
            return ($0 | lowerstByte) & ~(lowerstByte >> 1) // or 연산을 할경우 기존 수의 가장 왼쪽의 0이 1로 변경되고, 그거보다 더 오른쪽 수를 오른쪽으로 쉬프팅 하여(ex) 10) 역으로 만드어주면 해당 자리값을 0으로 가지고 있는다.
            // ex) 11 | 100 = 111 & 01 = 101 = 5
            // 따라서 두 수를 and 연산을 해주면 기존수에 0은 1로 변경되어있고 바로 다음 1은 0으로 변경되어 위 조건을 만족하는 값을 찾을수 있다.
        }
    }
    
//    var reversedArr: [Int] = []
//    var resultArr: [Int64] = []
//
//    for nums in numbers {
//        reversedArr = reversedBinary(Int(nums))
//        resultArr.append(Int64(compareArrs(reversedArr, Int(nums))))
//    }
    
//    return resultArr
}

func compareArrs(_ a: [Int], _ num: Int) -> Int {
    var arr: [Int] = []
    var diffCnt = false
    var comparingNum = num
    
    while true {
        if diffCnt {
            break
        } else {
            comparingNum += 1
        }
        
        arr = reversedBinary(comparingNum)
        diffCnt = getCnt(a, arr)
    }
    
    return comparingNum
}

func getCnt(_ aArr: [Int], _ bArr: [Int]) -> Bool {
    var diffCnt = 0
    var a = aArr
    var b = bArr
    
    if a.count > b.count {
        for _ in 0 ..< a.count - b.count {
            b.append(0)
        }
    } else {
        for _ in 0 ..< b.count - a.count {
            a.append(0)
        }
    }
    
    for i in 0 ..< a.count {
        if a[i] != b[i] {
            if diffCnt > 2 {
                return false
            }
            diffCnt += 1
        }
    }
    
    return diffCnt > 2 ? false : true
}

func reversedBinary(_ num: Int) -> [Int] {
    var resultArr: [Int] = []
    var temp = num
    
    while true {
        if temp == 0 || temp == 1 {
            resultArr.append(temp)
            break
        }
        
        resultArr.append(temp % 2)
        temp = temp / 2
    }
    
    return resultArr
}
