//
//  42888.swift
//  CodeTest
//
//  Created by AlexHwang on 2022/03/14.
//

import Foundation

/*
 링크: https://programmers.co.kr/learn/courses/30/lessons/42888
 걸린시간: 1h 10m
 */

func p42888() {
    print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))
}

func solution(_ record:[String]) -> [String] {
    // dictionary 2개 활용
    let actions = ["Enter" : "님이 들어왔습니다.", "Leave" : "님이 나갔습니다."]
    var user = [String : String]()
    var results: [String] = []
    
    record.forEach {
        let separated = $0.components(separatedBy: " ")
        // leave 제외, 어차피 필터할 데이터 기준에서는 leave는 필요 없다.
        if separated.count > 2 {
            user[separated[1]] = separated[2]
        }
    }
    
    results = record.filter { !$0.contains("Change") }.map { (value: String) -> String in
        let data = value.components(separatedBy: " ")
        
        // uid 기준으로 정렬된 사용자의 이름과 action 기준으로 분류된 문자열을 합쳐서 리턴
        let string = user[data[1]]! + actions[data[0]]!
        
        return string
    }
    
    return results
}
