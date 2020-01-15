import Foundation

public struct MinStack {

    var stack: [Int] = []
    var min = Int.max
    
    
    public init() {
        
    }
    
    public mutating func push(_ x: Int) {
        if stack.isEmpty {
            min = x
            stack.append(x - min)
        } else {
            stack.append(x - min)
            if x < min {
                min = x
            }
        }
    }
    
    public mutating func pop() {
        guard let value = stack.popLast() else {
            return
        }
        if value < 0 {
            min -=  min
        }
    }
    
   public func top() -> Int? {
        guard let value = stack.last else {
            return nil
        }
        if value < 0 {
            return min
        }
        return min + value
    }

    public func getMin() -> Int? {
        guard !stack.isEmpty else {
            return nil
        }
        return min
    }
}
