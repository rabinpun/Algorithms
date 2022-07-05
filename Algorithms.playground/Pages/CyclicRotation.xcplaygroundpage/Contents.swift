//: [Previous](@previous)

import Foundation

//MARK: Solution
struct Solution {
    
    static func solution(_ A: inout [Int], _ k: Int) -> [Int] {
        guard !A.isEmpty, k != A.count, k != 0 else { return A}
        let splitRange = 0...(k - 1)
        let firstSplit = A[splitRange]
        A.removeSubrange(splitRange)
        debugPrint(A)
        return A+firstSplit
    }
    
}

//MARK: Unit tests

import XCTest

class SolutionTests: XCTestCase {
    
    func test_Cyclic_Rotation() {
          var array = [1,2,3,4,5,6,7,8,9]
          XCTAssert(Solution.solution(&array,3) == [4,5,6,7,8,9,1,2,3])
          array = [6,7,8,9,10,1]
          XCTAssert(Solution.solution(&array,4) == [10,1,6,7,8,9])
          array = [6,7,8,9,10,1]
          XCTAssert(Solution.solution(&array,6) == [6,7,8,9,10,1])
          array = [6,7,8,9,10,1]
          XCTAssert(Solution.solution(&array,0) == [6,7,8,9,10,1])
    }
}

SolutionTests.defaultTestSuite.run()
