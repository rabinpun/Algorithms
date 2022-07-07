//: [Previous](@previous)

import Foundation

struct Solution {
    
    static func solution(_ array: [Int]) -> Int {
        guard !array.isEmpty else { return 0 }
        guard array.count > 1 else { return array.first! }
        
        var maxArea = 0
        
        for i in 0..<array.count {
            
            let currentHeight = array[i]
            var left = i
            
            while left - 1 >= 0 && array[left - 1] >= currentHeight {
                left -= 1
            }
            
            var right = i
            
            while right + 1 < array.count && array[right + 1] >= currentHeight {
                right += 1
            }
            debugPrint((right - left - 1) * currentHeight)
            maxArea = max(maxArea, (right - left + 1) * currentHeight )
        }
        return maxArea
    }
    
    static func solutionWithStacks(_ array: [Int]) -> Int {
        guard !array.isEmpty else { return 0 }
        guard array.count > 1 else { return array.first! }
        
        let newArray = [-1] + array + [-1]
        
        var leftToRight = Array(repeating: 0, count: newArray.count)
        var rightToLeft = Array(repeating: 0, count: newArray.count)
        
        var stack = [0]
        
        for i in stride(from: 1, through: newArray.count - 2, by: 1) {
            while newArray[stack.last!] >= newArray[i] {
                stack.removeLast()
            }
            leftToRight[i] = stack.last!
            stack.append(i)
            
        }
        
        stack = [newArray.count - 1]
        
        for i in stride(from: newArray.count - 2, through: 1, by: -1) {
            while newArray[stack.last!] >= newArray[i] {
                stack.removeLast()
            }
            rightToLeft[i] = stack.last!
            stack.append(i)
        }
        var maxArea = 0
        
        for i in stride(from: 1, through: newArray.count - 2, by: 1) {
            maxArea = max(maxArea, newArray[i] * ( rightToLeft[i] - leftToRight[i] - 1 ))
        }
        
        return maxArea
    }
    
}

//MARK: Unit tests

import XCTest

class SolutionTests: XCTestCase {

    func test() {
          XCTAssert(Solution.solutionWithStacks([2,1,5,6,2,3]) == 6)
          XCTAssert(Solution.solutionWithStacks([4,2,0,3,2,5]) == 10)
    }
}

SolutionTests.defaultTestSuite.run()
