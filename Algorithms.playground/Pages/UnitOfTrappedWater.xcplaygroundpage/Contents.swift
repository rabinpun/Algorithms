//: [Previous](@previous)

import Foundation

struct Solution {
    
    func soln(heights: [Int]) -> Int {
        guard heights.count > 2 else { return 0 }
    
        var largestHeightInLeftRight = Array(repeating: (0,0), count: heights.count)
        
        var height = heights.first!
        for index in stride(from: 1, to: heights.count - 1, by: 1) {
            height = max(heights[index - 1], height)
            largestHeightInLeftRight[index].0 = height
        }
        
        height = heights.last!
        for index in stride(from: heights.count - 2, to: 0, by: -1) {
            height = max(heights[index + 1], height)
            largestHeightInLeftRight[index].1 = height
        }
        
        var heightsForWater = [Int]()
        
        for index in 1..<heights.count - 1 {
            let selfHeight = heights[index]
            let minimumHeight = min(largestHeightInLeftRight[index].0, largestHeightInLeftRight[index].1)
            
            if minimumHeight > selfHeight {
                heightsForWater.append(minimumHeight - selfHeight)
            }
        }
        return heightsForWater.reduce(0, { $0 + $1 })
    }
    
    func solnDeepest(heights: [Int]) -> Int {
        guard heights.count > 2 else { return 0 }
    
        var largestHeightInLeft = Array(repeating: 0, count: heights.count)
        var largestHeightInRight = Array(repeating: 0, count: heights.count)
        
        var height = heights.first!
        for index in stride(from: 1, to: heights.count - 1, by: 1) {
            height = max(heights[index - 1], height)
            largestHeightInLeft[index] = height
        }
        
        height = heights.last!
        for index in stride(from: heights.count - 2, to: 0, by: -1) {
            height = max(heights[index + 1], height)
            largestHeightInRight[index] = height
        }
        
        var deepestHeight = 0
        
        for index in 1..<heights.count - 1 {
            let selfHeight = heights[index]
            let minimumHeight = min(largestHeightInLeft[index], largestHeightInRight[index])
            
            if minimumHeight > selfHeight {
                deepestHeight = max(deepestHeight, minimumHeight - selfHeight)
            }
        }
        return deepestHeight
    }
    
}

//MARK: Unit tests

import XCTest

class SolutionTests: XCTestCase {

    func test() {
        XCTAssertEqual(Solution().soln(heights: [0,1,0,2,1,0,1,3,2,1,2,1]), 6)
        XCTAssertEqual(Solution().solnDeepest(heights: [0,1,0,2,1,0,1,3,2,1,2,1]), 2)
        
    }
}

SolutionTests.defaultTestSuite.run()
