//: [Previous](@previous)

import Foundation

struct Solution {
    
    static func solution(_ blocks: [[String: Bool]],_ requirements: [String]) -> Int {
        
        var distances = [[Int]]()
        
        var minDistance: Int!
        
        for i in stride(from: 0, through: blocks.count - 1, by: 1) {
            distances.append([blocks.count,blocks.count,blocks.count])
            for (index,requirement) in requirements.enumerated() {
                if blocks[i][requirement]! {
                    distances[i][index] = 0
                } else if i > 0 {
                    distances[i][index] = distances[i - 1][index] + 1
                }
            }
        }
    
        for i in stride(from: blocks.count - 1, through: 0, by: -1) {
            for (index,requirement) in requirements.enumerated() {
                if blocks[i][requirement]! {
                    distances[i][index] = 0
                }
                if i < (blocks.count - 1), distances[i][index] > distances[i + 1][index] {
                    distances[i][index] = distances[i + 1][index] + 1
                }
            }
        }
        
        var solution = 0
        var maxDistanceForAReq = distances.first!.max()!
        for (i,distance) in distances.enumerated() {
            let currentDistance = distance.reduce(0, { $0 + $1})
            if minDistance == nil {
                minDistance = currentDistance
            } else {
                let currentMaxDistance = distance.max()!
                if minDistance >= currentDistance, maxDistanceForAReq >= currentMaxDistance {
                    solution = i
                    maxDistanceForAReq = currentMaxDistance
                }
                minDistance = min(minDistance, currentDistance)
            }
        }
        return solution
    }
    
}

import XCTest

class SolutionTests: XCTestCase {

    func test() {
        XCTAssert(Solution.solution([
            ["gym": false,"school": true, "store": false],
            ["gym": true,"school": false, "store": false],
            ["gym": true,"school": true, "store": true],
            ["gym": false,"school": true, "store": false],
            ["gym": false,"school": true, "store": true],
            ["gym": true,"school": false, "store": true],
            ], ["gym","school","store"]) == 2)
        
        XCTAssert(Solution.solution([
            ["gym": false,"school": true, "store": false],
            ["gym": false,"school": false, "store": false],
            ["gym": false,"school": true, "store": true],
            ["gym": false,"school": true, "store": false],
            ["gym": false,"school": true, "store": true],
            ["gym": true,"school": false, "store": false],
            ], ["gym","school","store"]) == 4)
        
        XCTAssert(Solution.solution([
            ["gym": false,"school": true, "store": false],
            ["gym": true,"school": false, "store": false],
            ["gym": true,"school": true, "store": false],
            ["gym": false,"school": true, "store": false],
            ["gym": false,"school": true, "store": false],
            ["gym": true,"school": false, "store": true],
            ], ["gym","school","store"]) == 5)
    }
}

SolutionTests.defaultTestSuite.run()
