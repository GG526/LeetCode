import Foundation

/*
 
 给定两个二进制字符串，返回他们的和（用二进制表示）。

 输入为非空字符串且只包含数字 1 和 0。

 示例 1:

 输入: a = "11", b = "1"
 输出: "100"
 示例 2:

 输入: a = "1010", b = "1011"
 输出: "10101"

 
 */


public func addBinary(_ a: String, _ b: String) -> String {
    let aArray = Array(a), bArray = Array(b)
    var i = aArray.count - 1, j = bArray.count - 1, x = 0, result = ""
    while i >= 0 || j >= 0 || x > 0 {
        var bitA: Int = {
            if i < 0 {
                return 0
            }
            defer {
                i -= 1
            }
            return Int(String(aArray[i]))!
        }()
        var bitB: Int = {
            if j < 0 {
                return 0
            }
            defer {
                j -= 1
            }
            return Int(String(bArray[j]))!
        }()
        let sum = bitA ^ bitB ^ x
        x = (bitA & bitB) | ((bitA | bitB) & x)
        result = "\(sum)" + result
    }
    return result
}
