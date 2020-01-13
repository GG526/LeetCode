import Foundation


  
//public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.left = nil
//        self.right = nil
//    }
//}
 


public func maxDepth(_ root: TreeNode?) -> Int {
    
    guard let root = root else {
        return 0
    }
    let leftLength = maxDepth(root.left)
    let rightLength = maxDepth(root.right)
    return max(leftLength, rightLength) + 1
}
