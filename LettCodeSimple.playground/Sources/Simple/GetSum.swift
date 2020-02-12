import Foundation

/*
 
 不使用运算符 + 和 - ​​​​​​​，计算两整数 ​​​​​​​a 、b ​​​​​​​之和。

 示例 1:

 输入: a = 1, b = 2
 输出: 3
 示例 2:

 输入: a = -2, b = 3
 输出: 1
 
 
 
 */


public func getSum(_ a: Int, _ b: Int) -> Int {

    var a = a
    var b = b
    while b != 0 {
        let temp = (a & b) << 1
        a = a ^ b
        b = temp
    }
    return a
}
