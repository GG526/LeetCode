import Foundation

/*
 
 给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。

 例如，给出 n = 3，生成结果为：

 [
   "((()))",
   "(()())",
   "(())()",
   "()(())",
   "()()()"
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/generate-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 p + q = n - 1
 
 
 */

public func generateParenthesis(_ n: Int) -> [String] {
    guard n > 0 else {
        return []
    }
    var dp: [[String]] = [[""], ["()"]], i = 2
    while i <= n {
        var list: [String] = [], j = 0
        while j < i {
            let listP = dp[j], listQ = dp[i - 1 - j]
            listP.forEach { (p) in
                listQ.forEach { (q) in
                    list.append("(\(p))\(q)")
                }
            }
            j += 1
        }
        dp.append(list)
        i += 1
    }
    return dp.last ?? []
}
