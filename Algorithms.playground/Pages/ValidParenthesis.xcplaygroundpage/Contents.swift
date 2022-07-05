//: [Previous](@previous)

import Foundation

struct Solution {
    
    static func isValid(_ S: String) -> Bool {
        guard !S.isEmpty else { return true }
        guard S.count % 2 == 0 else { return false }
        var stack = [Character]()
        
        for (_, char) in S.enumerated() {
            if char == "(" {
                stack.append(char)
            } else if stack.isEmpty {
                return false
            } else {
                stack.removeLast()
            }
        }
        return stack.isEmpty
    }
    
    static func isValidWithDifferentType(_ S: String) -> Bool {
        guard !S.isEmpty else { return true }
        guard S.count % 2 == 0 else { return false }
        
        var smallBracketStack = [Character]()
        var curlyBracketStack = [Character]()
        var largeBracketStack = [Character]()
        
        for (_, char) in S.enumerated() {
            if char == "(" {
                smallBracketStack.append(char)
            } else if char == ")" {
                guard !smallBracketStack.isEmpty else { return false }
                smallBracketStack.removeLast()
            } else if char == "{" {
                curlyBracketStack.append(char)
            } else if char == "}" {
                guard !curlyBracketStack.isEmpty else { return false }
                curlyBracketStack.removeLast()
            } else if char == "[" {
                largeBracketStack.append(char)
            } else if char == "]" {
                guard !largeBracketStack.isEmpty else { return false }
                largeBracketStack.removeLast()
            }
        }
        return smallBracketStack.isEmpty && curlyBracketStack.isEmpty && largeBracketStack.isEmpty
        
    }
    
}

//MARK: Unit tests

import XCTest

class SolutionTests: XCTestCase {

    func test_Valid_Paranthesis() {
          XCTAssert(Solution.isValid(""))
          XCTAssert(Solution.isValid("()()"))
          XCTAssert(Solution.isValid("(())"))
          XCTAssert(Solution.isValid("()()(())"))
          XCTAssert(!Solution.isValid("()()("))
          XCTAssert(!Solution.isValid("()((())"))
        
          XCTAssert(Solution.isValidWithDifferentType(""))
          XCTAssert(Solution.isValidWithDifferentType("()(){}[]"))
          XCTAssert(Solution.isValidWithDifferentType("(())[{}()]"))
          XCTAssert(Solution.isValidWithDifferentType("()()(()[]{})"))
          XCTAssert(!Solution.isValidWithDifferentType("()()]"))
          XCTAssert(!Solution.isValidWithDifferentType("()((())[{(}]"))
        
    }
}

SolutionTests.defaultTestSuite.run()
