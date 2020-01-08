import Foundation


func mopaoSort(_ nums : inout [Int]) -> [Int] {
    nums.enumerated().forEach { (index, item) in
        (0 ..< (nums.count - index - 1)).forEach {
            if nums[$0] > nums[$0 + 1] {
                nums.swapAt($0 + 1, $0)
            }
        }
    }
    return nums
}

func quickSort(_ nums: [Int]) -> [Int] {
    guard nums.count > 1 else {
        return nums
    }
    let pivot = nums[nums.count/2]
    let less = nums.filter { $0 < pivot}
    let equal = nums.filter {$0 == pivot}
    let greater = nums.filter {$0 > pivot}
    return quickSort(less) + equal + quickSort(greater)
}

func selectionSort(_ nums: inout [Int]) -> [Int] {
    nums.enumerated().forEach({(index, item) in
        var minIndex = index
        (index + 1 ..< nums.count).forEach {
            if nums[minIndex] > nums[$0] {
                minIndex = $0
            }
        }
        guard minIndex != index else { return }
        nums.swapAt(index, minIndex)
    })
    return nums
}
