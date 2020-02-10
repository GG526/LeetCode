import Foundation

/*
 
 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

  

 示例：

 给定数组 nums = [-1, 0, 1, 2, -1, -4]，

 满足要求的三元组集合为：
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/3sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */



public func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3 else {
        return []
    }
    let nums = nums.sorted(by: <)
    
    var i = 0, arr: [[Int]] = []
    while i < nums.count {
        if nums[i] > 0 {
            return arr
        }
        if i > 0, nums[i] == nums[i - 1] {
            continue
        }
        var l = i + 1, r = nums.count - 1
        while l < r {
            if nums[i] + nums[l] + nums[r] == 0 {
                arr.append([nums[i], nums[l], nums[r]])
                while l < r, nums[l] == nums[l + 1] {
                    l += 1
                }
                while l < r, nums[r] == nums[r - 1] {
                    r -= 1
                }
                l += 1
                r -= 1
            } else if nums[i] + nums[l] + nums[r] > 0 {
                r -= 1
            } else {
                l += 1
            }
        }
    }
    
    return arr
}
