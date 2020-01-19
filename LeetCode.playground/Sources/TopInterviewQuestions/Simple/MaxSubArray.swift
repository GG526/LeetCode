import Foundation

/*
 
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

 示例:

 输入: [-2,1,-3,4,-1,2,1,-5,4],
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 
 */


 public func maxSubArray(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    var currenMax = nums[0]
    var maxVaule = nums[0]
    (1..<nums.count).forEach { (index) in
        currenMax = max(nums[index], currenMax + nums[index])
        maxVaule = max(currenMax, maxVaule)
    }
    return maxVaule
}
