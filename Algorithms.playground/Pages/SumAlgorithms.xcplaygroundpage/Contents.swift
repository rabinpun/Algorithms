//: [Previous](@previous)

import Foundation

struct Solution {
    
    func canSumSolution(_ targetSum: Int, numbers: [Int], memo: inout [Int: Bool]) -> Bool {

        guard !memo.keys.contains(targetSum) else { return memo[targetSum]! }
        guard targetSum != 0 else { return true }// target sum possible to add upto
        guard targetSum > 0 else { return false }// target sum not possible to add upto
        
        for number in numbers {
            let remainder = targetSum - number
            memo[targetSum] = canSumSolution(remainder, numbers: numbers, memo: &memo)
            if memo[targetSum]! {
                return true
            }
        }
        memo[targetSum] = false
        return false
    }
    
    func canSumWithoutDuplicateSolution(_ targetSum: Int, numbers: [Int]) -> Bool {
        guard targetSum != 0 else { return true }// target sum possible to add upto
        guard targetSum > 0 else { return false }// target sum not possible to add upto
        
        for number in numbers {
            let remainder = targetSum - number
            let remainingNumbers = numbers.filter({ $0 != number })
            if canSumWithoutDuplicateSolution(remainder, numbers: remainingNumbers) {
                return true
            }
        }
        
        return false
    }
    
    func howSumSolution(_ targetSum: Int, numbers: [Int], memo: inout [Int: [Int]]) -> [Int] {
        
        guard !memo.keys.contains(targetSum) else { return memo[targetSum]! }
        guard targetSum != 0 else { return [] }
        guard targetSum > 0 else { return [-1] }// failure case
        
        for number in numbers {
            let remainder = targetSum - number
            
            let remainderResult = howSumSolution(remainder, numbers: numbers, memo: &memo)
            
            if remainderResult != [-1] {
                memo[targetSum] = remainderResult + [number]
                return memo[targetSum]!
            }
        }
        memo[targetSum] = [-1]
        return [-1]
    }
    
    func bestSumSolution(_ targetSum: Int, numbers: [Int], memo: inout [Int: [Int]] ) -> [Int] {
        
        guard !memo.keys.contains(targetSum) else {
            
            return memo[targetSum]! }
        guard targetSum != 0 else { return [] }
        guard targetSum > 0 else { return [-1] }// failure case
        
        var bestSum = [-1]
        
        for number in numbers {
            let remainder = targetSum - number
            
            let remainderResult = bestSumSolution(remainder, numbers: numbers, memo: &memo)
            
            if remainderResult != [-1] {
                memo[targetSum] = remainderResult + [number]
                if bestSum == [-1] || bestSum.count > memo[targetSum]!.count {
                    bestSum = memo[targetSum]!
                }
            }
        }
        memo[targetSum] = bestSum
        return bestSum
    }
    
}




import XCTest

class SolutionTests: XCTestCase {

    func test() {
        
        var memo: [Int: Bool] = [:]
        XCTAssert( Solution().canSumSolution(7, numbers: [1,2,3,4,5,6,7], memo: &memo))
        memo.removeAll()
        XCTAssert( Solution().canSumSolution(8, numbers: [1,2,4,5,6], memo: &memo))
        memo.removeAll()
        XCTAssert(!Solution().canSumSolution(300, numbers: [7, 14], memo: &memo))
        memo.removeAll()
        XCTAssert(Solution().canSumSolution(8, numbers: [4,5,6,7], memo: &memo))
        
        XCTAssert(!Solution().canSumWithoutDuplicateSolution(8, numbers: [4,5,6,7]))
        XCTAssert(Solution().canSumWithoutDuplicateSolution(8, numbers: [1,2,3,4,5]))
        
        
        var howSumMemo: [Int: [Int]] = [:]
        XCTAssertEqual(Solution().howSumSolution(8, numbers: [1,2,3,4,5], memo: &howSumMemo), [1,1,1,1,1,1,1,1])
        howSumMemo.removeAll()
        XCTAssertEqual(Solution().howSumSolution(200, numbers: [2,3,4,5], memo: &howSumMemo), Array(repeating: 2, count: 100))
        howSumMemo.removeAll()
        XCTAssertEqual(Solution().howSumSolution(300, numbers: [7, 14], memo: &howSumMemo), [-1])
        
        
        var bestSumMemo: [Int: [Int]] = [:]
        XCTAssertEqual(Solution().bestSumSolution(300, numbers: [7, 14], memo: &bestSumMemo), [-1])
        bestSumMemo.removeAll()
        XCTAssertEqual(Solution().bestSumSolution(8, numbers: [1,2,3,4,5], memo: &bestSumMemo), [5,3])
        bestSumMemo.removeAll()
        XCTAssertEqual(Solution().bestSumSolution(100, numbers: [1,2,3,4,5,20,25], memo: &bestSumMemo), [25,25,25,25])
    }
}
SolutionTests.defaultTestSuite.run()
