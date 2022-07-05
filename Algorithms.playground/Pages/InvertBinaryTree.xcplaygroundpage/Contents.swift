//: [Previous](@previous)

import Foundation

//Rules to invert the tree
//1. Left node of the original node becomes the root node
//2. Root node becomes left node of the right node of the new root node
//3. Right node of the original node becomes the left node of the new root node

struct Solution {
    
    static func invertBinaryTreeWithoutRecursion(_ root: Node?) -> Node? {
        var previousNode: Node?
        var nextNode: Node?
        var tempNode: Node?
        var currentNode = root
        
        while currentNode != nil {
            
            nextNode = currentNode?.left
            
            //swapping
            
            //swapping current node's left with previous node right
            currentNode?.left = tempNode
            tempNode = currentNode?.right
            
            //swapping current node's right with previous node left
            currentNode?.right = previousNode
            
            previousNode = currentNode
            currentNode = nextNode
        }
        
        return previousNode
    }
    
    static func invertBinaryTreeWithRecursion(_ root: Node?) -> Node? {
        guard root != nil, root?.left != nil, root?.right != nil else { return root }
        
        let newRoot = invertBinaryTreeWithRecursion(root?.left)
        root?.left?.left = root?.right
        root?.left?.right = root
        
        root?.left = nil
        root?.right = nil
        
        return newRoot
    }
}
