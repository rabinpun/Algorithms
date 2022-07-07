//: [Previous](@previous)

import Foundation

struct Solution {
    
    static func solution(_ n: Int, k: Int) -> Int {
        var permutation = [Int]()
        
        var unusedNumber = Array(1...n)
        
        var factorial = Array(repeating: 1, count: n + 1)
        
        for i in 1..<factorial.count {
            factorial[i] = factorial[i - 1] * i
        }
        
        var index = k - 1
        
        var partLength: Int!
        
        var length = n
        
        while length > 0 {
            partLength = factorial[length] / length

            let i = Int(index / partLength)
            permutation.append(unusedNumber[i])
            unusedNumber.remove(at: i)
            
            length -= 1
            index = index % partLength
        }
        
        var solutionString = ""
        
        for (_,element) in permutation.enumerated() {
            solutionString +=  "\(element)"
        }
        
        return Int(solutionString) ?? -1
    }
    
}

//MARK: Unit tests

import XCTest

class SolutionTests: XCTestCase {

    func test() {
        XCTAssert(Solution.solution(4, k: 16) == 3124)
    }
}

SolutionTests.defaultTestSuite.run()
