//: [Previous](@previous)

import Foundation

class Solution {
    
    var maxLevel = 0
    
//    var leftMaxLevel = 0
//    var rightMaxLevel = 0
    
    func leftView(_ root: Node?, nextLevel: Int) {
        guard root != nil else { return }
        
        if nextLevel > maxLevel {
            debugPrint(root!.value!)
            self.maxLevel = nextLevel
        }
        
        leftView(root?.left, nextLevel: nextLevel + 1)
        leftView(root?.right, nextLevel: nextLevel + 1)
    }
    
    func rightView(_ root: Node?, nextLevel: Int) {
        guard root != nil else { return }
        
        if nextLevel > maxLevel {
            debugPrint(root!.value!)
            self.maxLevel = nextLevel
        }
        
        rightView(root?.right, nextLevel: nextLevel + 1)
        rightView(root?.left, nextLevel: nextLevel + 1)
    }
    
    func leftAndRightView(_ root: Node?, nextLevel: Int) {
        guard root != nil else { return }
        
        leftView(root, nextLevel: 1)
        print("\n")
        maxLevel = 0
        rightView(root?.right, nextLevel: 2)
    }
    
}

let rootNode = Node(1)
rootNode.left = Node(2)
rootNode.right = Node(3)
rootNode.right?.right = Node(6)
rootNode.right?.right?.left = Node(7)
rootNode.right?.right?.right = Node(8)


Solution().leftAndRightView(rootNode, nextLevel: 1)
