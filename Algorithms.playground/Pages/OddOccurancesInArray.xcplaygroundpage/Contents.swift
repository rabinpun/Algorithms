//: [Previous](@previous)

import Foundation

//MARK: Solution
struct Solution {
    
    static func solution(_ A: [Int]) -> Int {
        guard A.count > 1 else { return A.first!}
        var elementCountDictionary = [Int:Int]()
        
        for (_,element) in A.enumerated() {
            elementCountDictionary[element, default: 0] += 1
        }
        
        let solutionKeyValuePair = elementCountDictionary.first(where: { $0.value % 2 != 0 })
        return solutionKeyValuePair!.key
    }
    
}

//MARK: Unit tests

import XCTest

class SolutionTests: XCTestCase {

    func test_Binary_Gap() {
          XCTAssert(Solution.solution([1,2,3,4,5,6,7,7,6,5,4,3,2]) == 1)
          XCTAssert(Solution.solution([1,1,2,3,4,5,6,7,7,5,4,3,2]) == 6)
          XCTAssert(Solution.solution([1,2,3,4,1,6,7,7,6,5,4,3,2]) == 5)
          XCTAssert(Solution.solution([1,2,3,4,5,6,7,7,6,5,4,1,2]) == 3)
    }
}

SolutionTests.defaultTestSuite.run()
