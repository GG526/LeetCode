import Foundation

/*
 
 给定一个包含 0, 1, 2, ..., n 中 n 个数的序列，找出 0 .. n 中没有出现在序列中的那个数。

 示例 1:

 输入: [3,0,1]
 输出: 2
 示例 2:

 输入: [9,6,4,2,3,5,7,0,1]
 输出: 8
 说明:
 你的算法应具有线性时间复杂度。你能否仅使用额外常数空间来实现?
 
 */


public func missingNumber(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    let nums = nums.sorted(by: <)
    if nums[0] != 0 {
        return 0
    }
    var i = 0
    while i < nums.count - 1 {
        let temp = nums[i + 1] - nums[i]
        if temp > 1 {
            return nums[i] + 1
        }
        i += 1
    }
    return nums[nums.count - 1] + 1
}

public func missingNumber2(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    var dic = [Int: Int]()
    nums.forEach { (item) in
        dic.updateValue(item, forKey: item)
    }
    for item in nums {
        if !dic.contains(where: { (key, value) -> Bool in
            if value == item {
                return true
            }
            return false
        }) {
            return item
        }
    }
    return 0
}

public func missingNumber3(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    var missValue = nums.count
    for (index, item)  in nums.enumerated() {
        missValue ^= (item ^ index)
    }
    return missValue
}

public func missingNumber4(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    let n = nums.count
    let total = (n * (n + 1))/2
    return total - nums.reduce(0, { (result, item) in
        return result + item
    })
}
