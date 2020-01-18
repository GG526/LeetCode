import Foundation

/*
 
 给定一个Excel表格中的列名称，返回其相应的列序号。

 例如，

     A -> 1
     B -> 2
     C -> 3
     ...
     Z -> 26
     AA -> 27
     AB -> 28
     ...
 示例 1:

 输入: "A"
 输出: 1
 示例 2:

 输入: "AB"
 输出: 28
 示例 3:

 输入: "ZY"
 输出: 701
 
 */


public func titleToNumber(_ s: String) -> Int {
    var value = 0
    for item in s {
        let num = (item.asciiValue ?? 0) - (Character("A").asciiValue ?? 0) + 1
        value = value * 26 + Int(num)
    }
    return value
}
