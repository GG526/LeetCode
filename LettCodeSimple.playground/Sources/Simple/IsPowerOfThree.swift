import Foundation

/*
 
 给定一个整数，写一个函数来判断它是否是 3 的幂次方。

 示例 1:

 输入: 27
 输出: true
 示例 2:

 输入: 0
 输出: false
 示例 3:

 输入: 9
 输出: true
 示例 4:

 输入: 45
 输出: false
 进阶：
 你能不使用循环或者递归来完成本题吗？
 
 */

public func isPowerOfThree(_ n: Int) -> Bool {
    guard n > 0 else {
        return false
    }
    var n = n
    while n % 3 == 0 {
        n /= 3
    }
    return n == 1
}

public func isPowerOfThree2(_ n: Int) -> Bool {
    guard n > 0 else {
        return false
    }
    let radix = String(n, radix: 3)
    let pattern = "^10*$"
    let re = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    let matchs = re?.matches(in: radix, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSRange(location: 0, length: radix.count))
    return matchs?.count ?? 0 > 0
}
