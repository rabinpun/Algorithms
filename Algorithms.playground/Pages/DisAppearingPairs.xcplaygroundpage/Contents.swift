//: [Previous](@previous)

import Foundation

//MARK: Solution
struct Solution {
    
    static func solution(_ S: String) -> String {
        guard S.count > 1 else { return S }
        var solution = ""
        for (_, char) in S.enumerated() {
            if !solution.isEmpty, solution[solution.index(solution.endIndex, offsetBy: -1)] == char {
                solution.remove(at: solution.index(solution.endIndex, offsetBy: -1))
            } else {
                solution.append(char)
            }
        }
        return solution
    }
    
}


//MARK: Unit tests

import XCTest

class SolutionTests: XCTestCase {
    
    func test_Disappearing_Pairs() {
        XCTAssert(Solution.solution("ABBCCD") == "AD")
        XCTAssert(Solution.solution("ACCAABBC") == "AC")
        XCTAssert(Solution.solution("ABCBBCBA") == "")
        XCTAssert(Solution.solution("ABCBBCBA") != "A")
        XCTAssert(Solution.solution("BABABA") == "BABABA")
    }
}

SolutionTests.defaultTestSuite.run()
