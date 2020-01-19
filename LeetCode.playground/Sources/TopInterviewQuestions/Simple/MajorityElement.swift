import Foundation

/*
 
 给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。

 你可以假设数组是非空的，并且给定的数组总是存在多数元素。

 示例 1:

 输入: [3,2,3]
 输出: 3
 示例 2:

 输入: [2,2,1,1,1,2,2]
 输出: 2
 
 */

public func majorityElement(_ nums: [Int]) -> Int {

    guard !nums.isEmpty else {
        return 0
    }
    let bound = nums.count/2
    var dic: [Int: Int] = [: ]
    var value = 0
    nums.forEach { (item) in
        let count = (dic[item] ?? 0) + 1
        dic.updateValue(count, forKey: item)
        if count > bound {
            value = item
        }
    }
    return value
}


public func majorityElement2(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    var candidate = 0
    var count = 0
    nums.forEach { (item) in
        if count == 0{
            candidate = item
        }
        count += (candidate == item ? 1 : -1)
    }
    return candidate
}
