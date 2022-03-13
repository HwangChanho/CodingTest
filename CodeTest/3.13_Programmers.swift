//
//  getRespond.swift
//  CodeTest
//
//  Created by AlexHwang on 2022/03/12.
//

import Foundation

/*
 https://programmers.co.kr/learn/courses/30/lessons/92334
 신입사원 무지는 게시판 불량 이용자를 신고하고 처리 결과를 메일로 발송하는 시스템을 개발하려 합니다. 무지가 개발하려는 시스템은 다음과 같습니다.
 
 각 유저는 한 번에 한 명의 유저를 신고할 수 있습니다.
 신고 횟수에 제한은 없습니다. 서로 다른 유저를 계속해서 신고할 수 있습니다.
 한 유저를 여러 번 신고할 수도 있지만, 동일한 유저에 대한 신고 횟수는 1회로 처리됩니다.
 k번 이상 신고된 유저는 게시판 이용이 정지되며, 해당 유저를 신고한 모든 유저에게 정지 사실을 메일로 발송합니다.
 유저가 신고한 모든 내용을 취합하여 마지막에 한꺼번에 게시판 이용 정지를 시키면서 정지 메일을 발송합니다.
 */

func getRespond() {
    print(solution2(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))
}

/*
 이용자의 ID가 담긴 문자열 배열 - id_list,
 각 이용자가 신고한 이용자의 ID 정보가 담긴 문자열 배열 - report,
 정지 기준이 되는 신고 횟수 k가 매개변수로 주어질 때,
 각 유저별로 처리 결과 메일을 받은 횟수를 배열에 담아 return 하도록 solution 함수를 완성해주세요.
 */

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    // 초기 선언 (report 당한 갯수 담을 dictionary, 결과 배열)
    var userReport: Dictionary<String, Int> = [:]
    var result: [Int] = []
    
    // 배열 중복 제거
    let tempReport: Set = Set(report)
    var newReport = Array(tempReport)
    
    // dictionary, result 초기화
    for i in 0 ..< id_list.count {
        userReport[id_list[i]] = 0
        result.append(0)
    }
    
    // 각 사람당 report 당한 횟수 구하기
    for i in 0 ..< newReport.count {
        let temp = newReport[i].components(separatedBy: " ")
        
        for item in userReport {
            if item.key == temp[1] {
                userReport[temp[1]]! += 1
            }
        }
    }
    
    // report 당한사람 출력
    for item in userReport {
        // 최대 신고 횟수이상으로 받았을때
        if item.value >= k {
            // 신고 당한사람 잡았으니 알림 보내자
            for data in newReport {
                let key = data.components(separatedBy: " ")[1]
                let value = data.components(separatedBy: " ")[0]
                
                if key == item.key {
                    for i in 0 ..< id_list.count {
                        if id_list[i] == value {
                            result[i] += 1
                        }
                    }
                }
            }
        }
    }
    
    return result
}

func solution2(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var dict: [String: [String]] = [:]
    var arr: [Int] = Array(repeating: 0, count: id_list.count)
    var ids: [String: Int] = [:]
    
    // 이름에 해당하는 index dictionary 생성
    for (index, id) in id_list.enumerated() {
        ids[id] = index
    }
    
    // [ 신고당한사람 : [신고자] ]
    for repo in report {
        let arr = repo.split(separator: " ").compactMap { String($0) }
        let name = arr[1]
        let singo = arr[0]
        if dict[name] == nil {
            dict.updateValue([singo], forKey: name)
        } else {
            if !dict[name]!.contains(singo) {
                dict[name]!.append(singo)
            }
        }
    }

    for name in dict.keys {
        if dict[name]!.count >= k {
            for n in dict[name]! {
                arr[ids[n]!] += 1
            }
        }
    }
    
    return arr
}
