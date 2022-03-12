
func b1181() {
    var input = [String]()
    var arr = [String]()
    
    for _ in stride(from: 0, to: Int(readLine()!)!, by: 1) {
        input.append(readLine()!)
    }
    
    arr = Array(Set(input)).sorted().sorted(by: {$0.count < $1.count})
    
    for i in 0 ..< arr.count {
        print(arr[i])
    } // 중복제거 -> 글자순정렬 -> 글자수정렬
}
