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
    
}

//
debugPrint(Solution.solution([4,2,0,3,2,5]))
[4,2,0,3,2,5]//6
[2,1,5,6,2,3]//10
