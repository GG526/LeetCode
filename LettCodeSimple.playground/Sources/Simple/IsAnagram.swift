import Foundation

/*
 
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

 示例 1:

 输入: s = "anagram", t = "nagaram"
 输出: true
 示例 2:

 输入: s = "rat", t = "car"
 输出: false

 说明:
 你可以假设字符串只包含小写字母。

 进阶:
 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？
 
 */


public func isAnagram(_ s: String, _ t: String) -> Bool {
    return s.sorted(by: >) == t.sorted(by: >)
}


public func isAnagram2(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else {
        return false
    }
    let s = Array(s)
    let t = Array(t)
    var count = Array(repeating: 0, count: 26)
    var i = 0
    while i < s.count {
        let aAsciiValue = Character("a").asciiValue!
        let sAsciiValue = s[i].asciiValue!
        let tAsciiValue = t[i].asciiValue!
        count[Int(sAsciiValue - aAsciiValue)] += 1
        count[Int(tAsciiValue - aAsciiValue)] -= 1
        i += 1
    }
    for item in count {
        if item != 0 {
            return false
        }
    }
    return true
}
