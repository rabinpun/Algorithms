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
        var visitedNodes = [Int]()
        
        queue.enqueue(root!)
        
        while !queue.isEmpty {
            let currentNode = queue.dequeue()!
            visitedNodes.append(currentNode.value!)
            
            if let leftNode = currentNode.left {
                queue.enqueue(leftNode)
            }
            if let rightNode = currentNode.right {
                queue.enqueue(rightNode)
            }
        }
        return visitedNodes.contains(value)
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
    }
}

SolutionTests.defaultTestSuite.run()
//     1
//  2     3
//4  5   6  7
