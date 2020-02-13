import Foundation

public extension String {
    func subString(to i: Int) -> String {
        guard i > 0 else {
            return ""
        }
        guard i < count else {
            return self
        }
        let endIndex = index(startIndex, offsetBy: i)
        return .init(self[...endIndex])
    }
    
    func subString(from i: Int) -> String {
        guard i > 0 else {
            return self
        }
        guard i < count else {
            return ""
        }
        let start = index(startIndex, offsetBy: i)
        return .init(self[start...])
    }
    
    func subString(from i: Int, length l: Int) -> String {
        guard i + l <= count else {
            return self
        }
        let start = index(startIndex, offsetBy: i)
        let end = index(start, offsetBy: l)
        return .init(self[start..<end])
    }
    
    func range2(target: String) -> (location: Int, length: Int) {
        guard let range = range(of: target) else {
            return (0, 0)
        }
        let nsRange = NSRange(range, in: self)
        return (nsRange.location, nsRange.location)
    }
    
    func range(target: String) -> (location: Int, lengeh: Int) {
           if target.isEmpty { return (0, 0) }
           var location = 0
           while location + target.count <= count {
               let i = index(startIndex, offsetBy: location)
               let j = index(i, offsetBy: target.count)
               let subString = self[i..<j]
               if subString == target {
                   return (location, target.count)
               }else {
                   location += 1
               }
           }
           return (0, 0)
       }
}
