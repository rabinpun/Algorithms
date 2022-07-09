import Foundation

//: [Next](@next)
public class Node {
    public var value: Int?
    public var left: Node?
    public var right: Node?
    
    public init(_ value: Int?) {
        self.value = value
    }
    
    public static func getRootNode() -> Node {
        let rootNode = Node(1)
        rootNode.left = Node(2)
        rootNode.right = Node(3)
        rootNode.left?.left = Node(4)
        rootNode.left?.right = Node(5)
        rootNode.right?.left = Node(6)
        rootNode.right?.right = Node(7)
        return rootNode
    }
    
    public static func getRootNodeTwo() -> Node {
        let rootNode = Node(1)
        rootNode.left = Node(2)
        rootNode.right = Node(3)
        rootNode.left?.left = Node(4)
        rootNode.left?.right = Node(5)
        rootNode.left?.right?.left = Node(8)
        rootNode.left?.right?.right = Node(9)
        rootNode.right?.left = Node(6)
        rootNode.right?.right = Node(7)
        return rootNode
    }
}
