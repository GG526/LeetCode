import Foundation

/*
 
 颠倒给定的 32 位无符号整数的二进制位。

  

 示例 1：

 输入: 00000010100101000001111010011100
 输出: 00111001011110000010100101000000
 解释: 输入的二进制串 00000010100101000001111010011100 表示无符号整数 43261596，
       因此返回 964176192，其二进制表示形式为 00111001011110000010100101000000。
 示例 2：

 输入：11111111111111111111111111111101
 输出：10111111111111111111111111111111
 解释：输入的二进制串 11111111111111111111111111111101 表示无符号整数 4294967293，
       因此返回 3221225471 其二进制表示形式为 10101111110010110010011101101001。
  

 提示：

 请注意，在某些语言（如 Java）中，没有无符号整数类型。在这种情况下，输入和输出都将被指定为有符号整数类型，并且不应影响您的实现，因为无论整数是有符号的还是无符号的，其内部的二进制表示形式都是相同的。
 在 Java 中，编译器使用二进制补码记法来表示有符号整数。因此，在上面的 示例 2 中，输入表示有符号整数 -3，输出表示有符号整数 -1073741825。
 
 */

// 题意理解错误
public func reverseBits(_ num: uint) -> uint {
    let binarySystem: [Character] = String(num, radix: 2).reversed()
    var value: uint = 0
    var head0: Bool = true
    var i = 0
    binarySystem.enumerated().forEach { (index, item) in
        if item == Character("0"), head0 {
            i += 1
            return
        }
        head0 = false
        if let n = uint(String(item)) {
            let temp = n * uint(pow(2.0, Double(index - i)))
            value += temp
            print(n, item, temp, value)
        }
    }
    return value
}


public func reverseBits2(_ num: uint32) -> uint32 {
    var value: uint32 = 0
    var i = 31
    while i >= 0 {
        value |= ((num >> (31 - i) & 1) << i)
    }
    return value
}
