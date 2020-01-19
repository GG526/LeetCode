import Foundation


public func maxDepth(_ root: TreeNode?) -> Int {
    
    guard let root = root else {
        return 0
    }
    let leftLength = maxDepth(root.left)
    let rightLength = maxDepth(root.right)
    return max(leftLength, rightLength) + 1
}
