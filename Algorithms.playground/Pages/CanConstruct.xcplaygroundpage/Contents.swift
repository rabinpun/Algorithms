//: [Previous](@previous)

import Foundation

struct Solution {
    
    func canConstruct(targetWord: String, words: [String]) -> Bool {
        
        guard !targetWord.isEmpty else { return true }
        
        for word in words {
            let remainderWord = targetWord.replacingOccurrences(of: word, with: "")
            if targetWord != remainderWord {
                if canConstruct(targetWord: remainderWord, words: words) {
                    return true
                }
            }
        }
        
        return false
    }
    
}




import XCTest

class SolutionTests: XCTestCase {

    func test() {
        
        Solution().canConstruct(targetWord: "abcd", words: ["ab","e","d"])
        
    }
}
SolutionTests.defaultTestSuite.run()
