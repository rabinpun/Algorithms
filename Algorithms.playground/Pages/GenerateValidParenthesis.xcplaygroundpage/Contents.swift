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
            if (closedParenthesisCount == size)
            {
                solution.append(result)
                return
            }
            if (openParenthesisCount < size)
            {
                self.balancedBracket(&solution, result + "(", size, openParenthesisCount + 1, closedParenthesisCount)
            }
            if (openParenthesisCount > closedParenthesisCount)
            {
                self.balancedBracket(&solution, result + ")", size, openParenthesisCount, closedParenthesisCount + 1);
            }
        }
}

//MARK: Unit tests

import XCTest

class SolutionTests: XCTestCase {

    func test() {
        XCTAssertEqual(Solution().soln(n: 3), ["((()))", "(()())", "(())()", "()(())", "()()()"])
        XCTAssertEqual(Solution().soln(n: 5), ["((((()))))", "(((()())))", "(((())()))", "(((()))())", "(((())))()", "((()(())))", "((()()()))", "((()())())", "((()()))()", "((())(()))", "((())()())", "((())())()", "((()))(())", "((()))()()", "(()((())))", "(()(()()))", "(()(())())", "(()(()))()", "(()()(()))", "(()()()())", "(()()())()", "(()())(())", "(()())()()", "(())((()))", "(())(()())", "(())(())()", "(())()(())", "(())()()()", "()(((())))", "()((()()))", "()((())())", "()((()))()", "()(()(()))", "()(()()())", "()(()())()", "()(())(())", "()(())()()", "()()((()))", "()()(()())", "()()(())()", "()()()(())", "()()()()()"])
    }
}

SolutionTests.defaultTestSuite.run()
