import Foundation

/*
 
 「外观数列」是一个整数序列，从数字 1 开始，序列中的每一项都是对前一项的描述。前五项如下：

 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 1 被读作  "one 1"  ("一个一") , 即 11。
 11 被读作 "two 1s" ("两个一"）, 即 21。
 21 被读作 "one 2",  "one 1" （"一个二" ,  "一个一") , 即 1211。

 给定一个正整数 n（1 ≤ n ≤ 30），输出外观数列的第 n 项。

 注意：整数序列中的每一项将表示为一个字符串。

  

 示例 1:

 输入: 1
 输出: "1"
 示例 2:

 输入: 4
 输出: "1211"

 
 */

public func countAndSay(_ n: Int) -> String {
    var person: String = "1"
    (1..<n).forEach{ i in
        var nextRow = "", count = 1, value = person[person.startIndex]
        (1..<person.count).forEach { (j) in
            let index = person.index(person.startIndex, offsetBy: j)
            let item = person[index]
            if value == item {
                count += 1
            } else {
                nextRow += "\(count)\(value)"
                value = item
                count  = 1
            }
        }
        nextRow += "\(count)\(value)"
        person = nextRow
    }
    return person
}


