import Foundation

/*
 
 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。

 说明:

 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 示例:

 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3

 输出: [1,2,2,3,5,6]

 
 */


public func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var x = 0
    nums1 = nums1.filter({ item in
        if x >= m {
            return item != 0
        }else {
            return true
        }
        x += 1
    })
    guard !nums1.isEmpty, !nums2.isEmpty else {
        nums1 += nums2
        nums1 = nums1.filter {
            return $0 != 0
        }
        return
    }
    var i = 0
    var j = 0
    while i < nums1.count {
        let c1 = nums1[i]
        let c2 = nums2[j]
        if c1 > c2 {
            nums1.insert(c2, at: i)
            j += 1
        }
        i += 1
    }
    
    if j < n {
        let arr = nums2[j..<n]
        nums1 += arr
    }
    nums1 = nums1.filter {
        return $0 != 0
    }
}


