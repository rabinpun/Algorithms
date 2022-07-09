import Foundation

extension Array {
    
    mutating func enqueue(_ element: Element) {
        append(element)
    }
    
    @discardableResult
    mutating func dequeue () -> Element? {
        removeFirst()
    }
    
}
