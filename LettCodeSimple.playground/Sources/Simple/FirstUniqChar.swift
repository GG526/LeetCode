import Foundation

/*
 
 给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。

 案例:

 s = "leetcode"
 返回 0.

 s = "loveleetcode",
 返回 2.
 
 */


public func firstUniqChar(_ s: String) -> Int {
    guard !s.isEmpty else {
        return -1
    }
    if s.count == 0 {
        return 0
    }
    let list = Array(s)
    var dic = [Character: Int]()
    var i = 0
    while i < list.count {
        var count = 0
        if let value = dic[list[i]] {
            count = value + 1
        }else {
            count = 1
        }
        dic.updateValue(count, forKey: list[i])
        i += 1
    }
    for (index, item) in list.enumerated() {
        if let count = dic[item], count == 1 {
            return index
        }
    }
    return -1
}
