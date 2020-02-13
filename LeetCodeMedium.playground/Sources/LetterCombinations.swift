import Foundation

/*
 
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。

 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
 
 示例:

 输入："23"
 输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 说明:
 尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


public func letterCombinations(_ digits: String) -> [String] {
 
    guard !digits.isEmpty else {
        return []
    }
    let dic = ["2": "abc",
               "3": "def",
               "4": "ghi",
               "5": "jkl",
               "6": "mno",
               "7": "pqrs",
               "8": "tuv",
               "9": "wxyz"]
    var result:[String] = [""]
    digits.forEach({
        let value = dic[String($0)], count = result.count
        var i = 0
        while i < count {
            let first = result.remove(at: 0)
            value?.forEach({
                result.append(first + String($0))
            })
            i += 1
        }
    })
    return result
}
