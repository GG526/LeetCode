import Foundation

/*
 
 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。

 说明：本题中，我们将空字符串定义为有效的回文串。

 示例 1:

 输入: "A man, a plan, a canal: Panama"
 输出: true
 示例 2:

 输入: "race a car"
 输出: false
 
 */


public func isPalindrome(_ s: String) -> Bool {
    guard !s.isEmpty else {
        return true
    }
    let arr = Array(s)
    var i = 0
    var j = arr.count - 1
    while i < j {
        while i < j && !isFit(arr[i]){
            i += 1
        }
        let chart1 = arr[i]
        while i < j && !isFit(arr[j]) {
            j -= 1
        }
        let chart2 = arr[j]
        if !isEqual(chart1: chart1, chart2: chart2) {
            return false
        }
        i += 1
        j -= 1
    }
    return true
}


func isFit(_ chart: Character) -> Bool {
    guard chart.isNumber || chart.isLetter else {
        return false
    }
    return true
}


func isEqual(chart1: Character, chart2: Character) -> Bool {
    let new1 = chart1.lowercased()
    let new2 = chart2.lowercased()
    return new1 == new2
}
