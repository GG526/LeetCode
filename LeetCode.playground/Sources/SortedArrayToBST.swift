import Foundation


/*
 
 将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。

 本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。

 示例:

 给定有序数组: [-10,-3,0,5,9],

 一个可能的答案是：[0,-3,9,-10,null,5]，它可以表示下面这个高度平衡二叉搜索树：

       0
      / \
    -3   9
    /   /
  -10  5

 
 */

public func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    
    var nums = nums
    guard !nums.isEmpty else {
        return nil
    }
    var val = nums[nums.count/2]
    let node = TreeNode(val)
    var indexLeft = 0
    let leftList = nums.filter { _ in
        defer { indexLeft += 1}
        return (indexLeft >= 0 && indexLeft < nums.count/2) ? true : false
    }
    node.left = sortedArrayToBST(leftList)
    var indexRight = 0
    let rightList = nums.filter { _ in
        defer { indexRight += 1 }
        return (indexRight > nums.count/2) ? true  : false
    }
    node.right = sortedArrayToBST(rightList)
    return node
}
