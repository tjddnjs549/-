import Foundation


// MARK: - 가우스의 수학공식

/*
 두 정수 a, b가 주어졌을 때 a와 b 사이에 속한 모든 정수의 합을 리턴하는 함수, solution을 완성하세요.
예를 들어 a = 3, b = 5인 경우, 3 + 4 + 5 = 12이므로 12를 리턴합니다.
*/


func solution(_ a: Int, _ b: Int) -> Int64 {
    
    return Int64( a <= b ? Array(a...b).reduce(0, +) :
                           Array(b...a).reduce(0, +) )
}
/// -> 되긴 하지만 런타임 오류가 생김
/// ❗️why? -10,000,000 ~ 10,000,000 이면 다 더해야 해서 오래 걸림 (시간 복잡도 업)



func solution1(_ a: Int, _ b: Int) -> Int64 {
    return a <= b ? Int64((b - a + 1) * (a + b) / 2) :
                    Int64((a - b + 1) * (b + a) / 2)
}

/// 가우스의 합 공식은 등차수열의 합을 간단하게 계산하는 공식
/// 1 ~ 100 까지 더하는 공식 (1 + 100) * (100 / 2)
/// ❗️(b - a + 1) : 합할 항의 갯수 , ❗️(a + b): (첫번째 항 + 마지막 항)


