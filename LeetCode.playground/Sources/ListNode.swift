import Foundation

public class ListNode: Equatable {
    var val: Int
    var next: ListNode?
    let id: UUID
    
    init(_ value: Int) {
        val = value
        id = UUID()
    }
    
    public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.id == rhs.id
    }
 }
