import Foundation

/*
 
 统计所有小于非负整数 n 的质数的数量。

 示例:

 输入: 10
 输出: 4
 解释: 小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。
 
 */

public func countPrimes(_ n: Int) -> Int {
    var count = 0
    var i = 2
    while i < n {
        if isPrimes(i) {
            count += 1
        }
        i += 1
    }
    return count
}

func isPrimes(_ n: Int) -> Bool {
    var i = 2
    while(i * i <= n) {
        if n % i == 0 {
            return false
        }
        i += 1
    }
    return true
}


public func countPrimes2(_ n: Int) -> Int {
    guard n > 2 else {
        return 0
    }
    var primes: [Bool] = Array(repeating: true, count: n)
    primes[0] = false
    primes[1] = false
    primes.enumerated().forEach({
        if $1 {
            var i = $0 * $0
            while i < n {
                primes[i] = false
                i += $0
            }
        }
    })
    var count = 0
    primes.forEach ({
        if $0 {
            count += 1
        }
    })
    return count
}
