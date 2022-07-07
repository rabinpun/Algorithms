//: [Previous](@previous)

import Foundation

struct Solution {
    
    static func solution(_ heights: [Int]) -> Int {
        guard heights.count > 3 else { return 0}
        
        var maxDepth = 0
        
        for i in 0..<heights.count {
            var left = i
            let currentHeight = heights[i]
            var rightDepth = currentHeight
            var leftDepth = currentHeight
            while left - 1 >= 0 && heights[left - 1] < currentHeight {
                leftDepth = min(leftDepth, heights[left - 1])
                left -= 1
            }
            var right = i
            while right + 1 < heights.count && heights[right + 1] < currentHeight {
                rightDepth = min(rightDepth, heights[right + 1])
                right += 1
            }
            
            let leftIndex = left > 0 ? left - 1 : left
            let rightIndex = right < (heights.count - 1) ? right + 1 : right
            let leftHight = max(heights[leftIndex], currentHeight)
            let rightHight = max(heights[rightIndex], currentHeight)
            if leftHight == rightHight {
                continue
            }
            else if leftHight < rightHight {
                maxDepth = max(maxDepth, leftHight - rightDepth)
            } else {
                maxDepth = max(maxDepth, rightHight - leftDepth)
            }
        }
        
        return maxDepth
    }
    
}

//MARK: Unit tests

import XCTest

class SolutionTests: XCTestCase {

    func test() {
          XCTAssert(Solution.solution([1,3,2,1,2,1,5,3,3,4,2]) == 2)
//          XCTAssert(Solution.solutionWithStacks([4,2,0,3,2,5]) == 10)
    }
}

SolutionTests.defaultTestSuite.run()
