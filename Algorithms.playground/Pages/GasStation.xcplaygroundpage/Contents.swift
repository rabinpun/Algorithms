//: [Previous](@previous)

import Foundation

//: [Next](@next)

struct Solution {
    
    static func solution(_ gas: [Int], _ cost: [Int]) -> Int {
        
        var skipIndex: Int?
        
        for (i,_) in gas.enumerated() {
            if let skipIndex = skipIndex, i < skipIndex {
                continue
            }
            let resultForCurrentIndex = canMakeRoundTrip(gas,cost,index: i)
            if resultForCurrentIndex.0 {
                return resultForCurrentIndex.1
            } else {
                skipIndex = resultForCurrentIndex.1
            }
        }
        return -1
    }
    
    private static func canMakeRoundTrip(_ gas: [Int], _ cost: [Int], index: Int) -> (Bool,Int) {
        var started = false
        var currentIndex = index
        var remainingFuel = 0
        while currentIndex != index || !started {
            started = true
            remainingFuel = remainingFuel + gas[currentIndex] - cost[currentIndex]
            guard remainingFuel >= 0 else { return (false,currentIndex) }
            currentIndex = (currentIndex + 1) % gas.count
        }
        return (true,currentIndex)
    }
    
}

//MARK: Unit tests

let gas = [1,5,3,3,5,3,1,3,4,5]//8
let cost = [5,2,2,8,2,4,2,5,1,2]

let gas2 = [1,2,3,4,5]//3
let cost2 = [3,4,5,1,2]

let gas3 = [3,3,4]
let cost3 = [3,4,3]//2

let gas4 = [4,5,2,6,5,3]
let cost4 = [3,2,7,3,2,9]

import XCTest

class SolutionTests: XCTestCase {

    func test_Odd_Occurances() {
          XCTAssert(Solution.solution(gas,cost) == 8)
          XCTAssert(Solution.solution(gas2,cost2) == 3)
          XCTAssert(Solution.solution(gas3,cost3) == 2)
          XCTAssert(Solution.solution(gas4,cost4) == -1)
    }
}

SolutionTests.defaultTestSuite.run()
