import Foundation


//MARK: Solution
struct Solution {
    
    static func binaryGap(_ N: Int) -> Int {
        let binaryRep = String(N, radix: 2)
        var bitIndices = [Int]()
        var largestGap = 0
        
        for (i, char) in binaryRep.enumerated() where char == "1" {
            bitIndices.append(i)
        }
        
        for i in 0...bitIndices.count - 2 {
            let gap = bitIndices[i+1] - bitIndices[i] - 1
            largestGap = max(gap,largestGap)
        }
        
        return largestGap
    }
    
}

//MARK: Unit tests

import XCTest
class SolutionTests: XCTestCase {
    
    func testBinaryGap() {
        XCTAssert(Solution.binaryGap(1041) == 5)
        XCTAssert(Solution.binaryGap(15) == 0)
        XCTAssert(Solution.binaryGap(32) == 0)
        XCTAssert(Solution.binaryGap(529) == 4)
    }
}

SolutionTests().run()
