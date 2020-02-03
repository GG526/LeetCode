import Foundation

/*
 
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

 示例 1:

 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

public func lengthOfLongestSubstring(_ s: String) -> Int {
    var i = 0
    let s = Array(s)
    var result = [[Character]]()
    var currentList = [Character]()
    while i < s.count {
        let current = s[i]
        if currentList.contains(current) {
            result.append(currentList)
            var reperIndex: Int?
            var list = [Character]()
            for (index, item) in currentList.enumerated() {
                if item == current {
                    reperIndex = index
                } else {
                    if let ind = reperIndex, index > ind {
                        list.append(item)
                    }
                }
            }
            currentList = list
            currentList.append(current)
        } else {
            currentList.append(current)
        }
        
        i += 1
    }
    result.append(currentList)
    var maxCount = 0
    for item in result {
        print(item)
        maxCount = max(maxCount, item.count)
    }
    return maxCount
}


public func lengthOfLongestSubstring2(_ s: String) -> Int {
    let list = Array(s)
    var i = 0
    var j = 0
    var ans = 0
    var dic = [Character: Int]()
    while j < list.count {
        if dic.contains(where: { (key, value) -> Bool in
            return key == list[j]
        }) {
            i = max(i, dic[list[j]] ?? 0)
        }
        ans = max(ans, j - i + 1)
        dic.updateValue(j + 1, forKey: list[i])
        j += 1
    }
    return ans
}
