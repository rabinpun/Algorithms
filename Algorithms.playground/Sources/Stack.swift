import Foundation

extension Array {
    
    mutating func push(_ element: Element) {
        append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        removeLast()
    }
    
}
