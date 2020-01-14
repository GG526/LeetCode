import Foundation

/*
 
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

 说明：

 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

 示例 1:

 输入: [2,2,1]
 输出: 1
 示例 2:

 输入: [4,1,2,1,2]
 输出: 4
 
 */


public func singleNumber(_ nums: [Int]) -> Int {
    let nums = nums.sorted()
    var i = 0
    while i < nums.count - 1 {
        if nums[i] == nums[i + 1] {
            i += 2
        }else {
            return nums[i]
        }
    }
    return nums[nums.count - 1]
}


public func singleNumber2(_ nums: [Int]) -> Int {
    var value = 0
    for item in nums {
        value ^= item
    }
    return value
}
