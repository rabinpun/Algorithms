//: [Previous](@previous)

import Foundation

//Rules to invert the tree
//1. Left node of the original node becomes the root node
//2. Root node becomes left node of the right node of the new root node
//3. Right node of the original node becomes the left node of the new root node

struct Solution {
    
    static func isSymmetric(_ leftNode: Node?, _ rightNode: Node?) -> Bool {
        
        if leftNode == nil && rightNode == nil {
            return true
        } else if leftNode == nil || rightNode == nil || leftNode?.value != rightNode?.value  {
            return false
        } else {
            return isSymmetric(leftNode?.left, rightNode?.right) && isSymmetric(leftNode?.right, rightNode?.left)
        }
    }
    
    static func isSymmetricWithOutRecursion(_ root: Node) -> Bool {
        
        var nodeStack = [Node]()
        
        nodeStack.append(root)
        nodeStack.append(root)
        
        while !nodeStack.isEmpty {
            let rightNode = nodeStack.removeLast()
            let leftNode = nodeStack.removeLast()
            
            if leftNode.left?.value != rightNode.right?.value || leftNode.right?.value != rightNode.left?.value {
                return false
            } else  {
                if leftNode.left != nil {
                    nodeStack.append(leftNode.left!)
                    nodeStack.append(rightNode.right!)
                }
                if leftNode.right != nil {
                    nodeStack.append(leftNode.right!)
                    nodeStack.append(leftNode.left!)
                }
            }
        }
        return true
        
    }
    
}
