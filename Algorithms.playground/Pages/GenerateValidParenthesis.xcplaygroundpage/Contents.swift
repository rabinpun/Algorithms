//: [Previous](@previous)

import Foundation

struct Solution {
    
    func soln(n: Int) -> [String] {
        var solution = [String]()
        balancedBracket(&solution,"", n, 0, 0)
        return solution
    }

    func balancedBracket(_ solution: inout [String],_ result: String, _ size: Int, _ openParenthesisCount: Int, _ closedParenthesisCount: Int)
        {
            if (close == size)
            {
                solution.append(result)
                return
            }
            if (open < size)
            {
                self.balancedBracket(&solution, result + "(", size, openParenthesisCount + 1, closedParenthesisCount)
            }
            if (open > close)
            {
                self.balancedBracket(&solution, result + ")", size, openParenthesisCount, closedParenthesisCount + 1);
            }
        }
}

//MARK: Unit tests

import XCTest

class SolutionTests: XCTestCase {

    func test() {
        debugPrint(Solution().soln(n: 3))
    }
}

SolutionTests.defaultTestSuite.run()
