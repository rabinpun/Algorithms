import Foundation

public extension Array {
    
    mutating func enqueue(_ element: Element) {
        append(element)
    }
    
    @discardableResult
    mutating func dequeue () -> Element? {
        removeFirst()
    }
    
}
