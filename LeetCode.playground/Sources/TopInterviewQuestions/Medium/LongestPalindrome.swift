import Foundation

/*
 
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

 示例 1：

 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 示例 2：

 输入: "cbbd"
 输出: "bb"

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-palindromic-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 dp[i][j] = dp[i] == dp[j] && dp[i + 1][j - 1]
 
 
 j - 1 - (i + 1) + 1 < 2 ===> j - i < 3
 
 */


public func longestPalindrome(_ s: String) -> String {
    guard s.count > 1 else {
        return s
    }
    let list = Array(s)
    var dp = [[Bool]]()
    dp = Array.init(repeating: Array.init(repeating: false, count: list.count), count: list.count)
    var i = 1, index = 0, length = 1
    while i < list.count {
        var j = 0
        while j < i {
            if list[j] == list[i] {
                if i - j < 3 {
                    dp[j][i] = true
                }else {
                    dp[j][i] = dp[j + 1][i - 1]
                }
            }else {
                dp[j][i] = false
            }
            if dp[j][i], i - j + 1 > length {
                index = j
                length = i - j + 1
            }
            j += 1
        }
        i += 1
    }
    print(index, length)
    return s.subString(from: index, length: length)
    
}
