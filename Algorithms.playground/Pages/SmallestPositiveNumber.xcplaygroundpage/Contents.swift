//: [Previous](@previous)

import Foundation

struct Solution {
    
    func findSmallestMissingPositiveInteger(_ nums: inout [Int]) -> Int {
        
        let n = nums.count
             
    //            # Check if 1 is present in array or not
        guard nums.contains(1) else { return 1 }
             
    //        # Changing values to 1 for extreme inputs
        for i in 0..<nums.count {
            if nums[i] <= 0 || nums[i] > n { nums[i] = 1 }
                
        }
                 
    //        # Updating indices values
        for i in 0..<nums.count {
            let index = (nums[i] - 1) % n
            nums[index] += n
        }
        
    //        # Finding which index has value less than n
        for i in 0..<nums.count {
            if nums[i] <= n { return i + 1 }// this means the solution was with in the range
                
        }
     
    //        # If array has values from 1 to n
        return (n + 1)
    }
    
}

//MARK: Unit tests

import XCTest

class SolutionTests: XCTestCase {

    func test() {
        var nums1 = [3,8,2,1,6]
        XCTAssertEqual(Solution().findSmallestMissingPositiveInteger(&nums1), 4)
        
        
    }
}

SolutionTests.defaultTestSuite.run()
