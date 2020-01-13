import Foundation

/*
 
 给定一个二叉树，检查它是否是镜像对称的。

 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

     1
    / \
   2   2
  / \ / \
 3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

     1
    / \
   2   2
    \   \
    3    3
 
 */


public func isSymmetric(_ root: TreeNode?) -> Bool {
    return equal(root, t2: root)
}

public func equal(_ t1: TreeNode?, t2:TreeNode?) -> Bool{
    if t1 == nil && t2 == nil { return true }
    if t1 == nil || t2 == nil { return false }
    return (t1?.val == t2?.val) &&
        equal(t1?.left, t2: t2?.right) &&
        equal(t1?.right, t2: t2?.left)
        
}


public func isSymmetric2(_ root: TreeNode?) -> Bool {
    guard let root = root else {
        return true
    }
    var queue: [TreeNode] = []
    queue.append(root)
    queue.append(root)
    while !queue.isEmpty {
        let t1 = queue.first
        if t1 != nil {
            queue.remove(at: 0)
        }
        
        let t2 = queue.first
        if t2 != nil {
            queue.remove(at: 0)
        }
        
        if t2 == nil && t1 == nil { continue }
        if t2 == nil || t1 == nil {
            return false
        }
        if t1?.val != t2?.val {
            return false
        }
        if let left1 = t1?.left {
            queue.append(left1)
        }
        if let right2 = t2?.left {
            queue.append(right2)
        }
        if let left2 = t2?.left {
            queue.append(left2)
        }
        if let right1 = t1?.right {
            queue.append(right1)
        }
    }
    return true
}
