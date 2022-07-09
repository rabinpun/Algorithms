//: [Previous](@previous)

import Foundation

class Solution {
    
    func printDepthFirst(_ root: Node?) {
        guard root != nil else { return }
        var stack = [Node]()
        stack.push(root!)
        
        while !stack.isEmpty {
            let currentNode = stack.pop()!
            print(currentNode.value!)
            
            if let rightNode = currentNode.right {
                stack.push(rightNode)
            }
            if let leftNode = currentNode.left {
                stack.push(leftNode)
            }
        }
        print("\n")
    }
    
    func printBreadthFirst(_ root: Node?) {
        guard root != nil else { return }
        var queue = [Node]()
        
        queue.enqueue(root!)
        
        while !queue.isEmpty {
            let currentNode = queue.dequeue()!
            print(currentNode.value!)
            
            if let leftNode = currentNode.left {
                queue.enqueue(leftNode)
            }
            if let rightNode = currentNode.right {
                queue.enqueue(rightNode)
            }
        }
        print("\n")
    }
    
    func treeIncludes(_ root: Node?, value: Int) -> Bool {
        guard root != nil else { return false }
        var queue = [Node]()
        
        queue.enqueue(root!)
        
        while !queue.isEmpty {
            let currentNode = queue.dequeue()!
            if currentNode.value == value {
                return true
            }
            if let leftNode = currentNode.left {
                queue.enqueue(leftNode)
            }
            if let rightNode = currentNode.right {
                queue.enqueue(rightNode)
            }
        }
        return false
    }
    
    func treeIncludesSide(_ root: Node?, value: Int) -> String {
        guard root != nil else { return "Doesnt contain node with \(value) value" }
        var stack = [Node]()
        var visitedNodes = [Int]()
        
        stack.push(root!)
        
        var firstIteration = true
        var traversingRight = false
        
        while !stack.isEmpty {
            let currentNode = stack.pop()!
            visitedNodes.append(currentNode.value!)
            
            //started traversing right side
            if stack.isEmpty, !firstIteration {
                traversingRight = true
            }
            
            if visitedNodes.contains(value) {
                return traversingRight ? "Right" : "Left"
            }
            
            if let rightNode = currentNode.right {
                stack.push(rightNode)
            }
            if let leftNode = currentNode.left {
                stack.push(leftNode)
            }
            firstIteration = false
        }
        return "Doesnt contain node with \(value) value"
    }
    
//    var maxLeafToNodeSum = 0
//    var currentSum =
    
    func maxRootToLeafPathSum(_ root: Node?) -> Int {
        guard root != nil else { return 0 }
        var stack = [(Node,Int)]()
        stack.push((root!,0))
        
        var sums = [Int]()
        var currentSum = 0
        
        while !stack.isEmpty {
            let currentNode = stack.pop()!
            
            currentSum = currentNode.0.value! + currentNode.1
            
            if let rightNode = currentNode.0.right {
                stack.push((rightNode,currentSum))
            }
            if let leftNode = currentNode.0.left {
                stack.push((leftNode,currentSum))
            } else {
                sums.append(currentSum)
                currentSum -= currentNode.0.value!
            }
        }
        return sums.max()!
    }

}

//Solution().printDepthFirst(Node.getRootNode())
//Solution().printBreadthFirst(Node.getRootNode())
import XCTest

class SolutionTests: XCTestCase {

    func test() {
        XCTAssertEqual(Solution().treeIncludes(Node.getRootNode(), value: 7), true)
        XCTAssertEqual(Solution().treeIncludes(Node.getRootNode(), value: 5), true)
        XCTAssertEqual(Solution().treeIncludes(Node.getRootNode(), value: 3), true)
        XCTAssertEqual(Solution().treeIncludes(Node.getRootNode(), value: 9), false)
        XCTAssertEqual(Solution().treeIncludes(Node.getRootNode(), value: 0), false)

        XCTAssertEqual(Solution().treeIncludesSide(Node.getRootNode(), value: 7), "Right")
        XCTAssertEqual(Solution().treeIncludesSide(Node.getRootNode(), value: 5), "Left")
        XCTAssertEqual(Solution().treeIncludesSide(Node.getRootNode(), value: 3), "Right")
        XCTAssertEqual(Solution().treeIncludesSide(Node.getRootNode(), value: 9), "Doesnt contain node with 9 value")
        XCTAssertEqual(Solution().treeIncludesSide(Node.getRootNode(), value: 0), "Doesnt contain node with 0 value")
        
        XCTAssertEqual(Solution().maxRootToLeafPathSum(Node.getRootNodeTwo()), 17)
        XCTAssertEqual(Solution().maxRootToLeafPathSum(Node.getRootNode()), 11)
    }
}

SolutionTests.defaultTestSuite.run()
//     1
//  2     3
//4  5   6  7
//  8  9
