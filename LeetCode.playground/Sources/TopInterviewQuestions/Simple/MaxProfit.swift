import Foundation

/*
 
 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。

 如果你最多只允许完成一笔交易（即买入和卖出一支股票），设计一个算法来计算你所能获取的最大利润。

 注意你不能在买入股票前卖出股票。

 示例 1:

 输入: [7,1,5,3,6,4]
 输出: 5
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
 示例 2:

 输入: [7,6,4,3,1]
 输出: 0
 解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。

 
 
 dp[i][k][0] = max(dp[i - 1][k][0], dp[i - 1][k][1] + price[i]) 今天不持有股票 1. 昨天不持有, 2. 昨天持有然后今天卖了
 dp[i][k][1] = max(dp[i - 1][k][1], dp[i - 1][k - 1][0] - price[i]) 今天持有股票 1. 昨天持有, 2. 昨天c不持有今天买了
 
 
 */


public func maxProfit(_ prices: [Int]) -> Int {
    var minValue = Int.max
    var maxProfit = 0
    prices.forEach { (item) in
        if item < minValue {
            minValue = item
        } else {
            maxProfit = max(item - minValue, maxProfit)
        }
    }
    return maxProfit
}



public func profit(_ prices: [Int]) -> Int {
    var dpI0 = 0, dpI1 = Int.min
    prices.forEach({
        dpI0 = max(dpI0, dpI1 + $0)
        dpI1 = max(dpI1, -$0)
    })
    return dpI0
}



public func maxProfit_k_inf(_ prices: [Int]) -> Int {
    var i0 = 0, i1 = Int.min
    prices.forEach({
        let temp = i0
        i0 = max(i0, i0 + $0)
        i1 = max(i1, temp - $0)
    })
    return i0
}

public func maxProfit_k_any(_ maxK: Int, prices:[Int]) -> Int {
    if maxK > prices.count/2 {
        return maxProfit_k_inf(prices)
    }
    var arr = Array.init(repeating: Array.init(repeating: Array.init(repeating: 0, count: 2), count: maxK), count: prices.count)
    var i = 0
    while i < prices.count {
        var k = maxK
        while k > 1 {
            if i == 0 {
                arr[i][k][0] = 0
                arr[i][k][1] = -prices[i]
                continue
            }
            arr[i][k][0] = max(arr[i - 1][k][0], arr[i - 1][k][1] + prices[i])
            arr[i][k][1] = max(arr[i - 1][k][1], arr[i - 1][k - 1][0] - prices[i])
            k -= 1
        }
        i += 1
    }
    return arr[prices.count - 1][maxK][0]
}
