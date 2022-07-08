import Foundation

//: [Next](@next)
public class Node {
    public var value: Int?
    public var left: Node?
    public var right: Node?
    
    public init(_ value: Int?) {
        self.value = value
    }
}
