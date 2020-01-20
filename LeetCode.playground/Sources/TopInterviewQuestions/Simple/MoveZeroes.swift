import Foundation

/*
 
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

 示例:

 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 说明:

 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。

 
 */

public func moveZeroes(_ nums: inout [Int]) {
    var count = 0
    nums = nums.filter { (item) -> Bool in
        if item == 0 {
            count += 1
            return false
        }else {
            return true
        }
    }
    nums += Array(repeating: 0, count: count)
}


public func moveZeroes2(_ nums: inout [Int]) {
    var slow = 0
    var fast = 0
    while fast < nums.count {
        if nums[fast] != 0 {
            nums.swapAt(slow, fast)
            slow += 1
        }
        fast += 1
    }
}
