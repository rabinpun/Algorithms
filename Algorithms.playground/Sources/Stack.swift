import Foundation

public extension Array {
    
    mutating func push(_ element: Element) {
        append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        removeLast()
    }
    
}
