//: [Previous](@previous)

import Foundation

struct Solution {
    
    func solution(_ row: Int, _ column: Int, memo: inout [String: Int]) -> Int {
        let key = "\(row),\(column)"
        guard !memo.keys.contains(key) else { return memo[key]! }
        guard row != 0 || column != 0 else { return 0 }// 0 ways to travel grid
        guard row != 1 , column != 1 else { return 1 }// only 1 way to travel 1 * 1 grid
        
        memo[key] = solution(row - 1, column, memo: &memo) + solution(row, column - 1, memo: &memo)
        return memo[key]!
    }
    
}




import XCTest

class SolutionTests: XCTestCase {

    func test() {
        
        var memo: [String: Int] = [:]
        XCTAssert( Solution().solution(18, 18, memo: &memo) == 2333606220)
    }
}
SolutionTests.defaultTestSuite.run()
