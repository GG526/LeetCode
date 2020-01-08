import Foundation

/*
 
 给定一个仅包含大小写字母和空格 ' ' 的字符串，返回其最后一个单词的长度。

 如果不存在最后一个单词，请返回 0 。

 说明：一个单词是指由字母组成，但不包含任何空格的字符串。

 示例:

 输入: "Hello World"
 输出: 5

 
 */


public func lengthOfLastWord(_ s: String) -> Int {
    var i = s.count
    while i > 0, s[s.index(s.startIndex, offsetBy: i - 1)] == Character.init(" "){
        i -= 1
    }
    print(i)
    guard i > 0 else {
        return 0
    }
    var j = i
    while j > 0, s[s.index(s.startIndex, offsetBy: j - 1)] != Character.init(" "){
        j -= 1
    }
    return i - j
}
