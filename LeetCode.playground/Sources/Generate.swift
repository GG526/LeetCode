import Foundation

/*
 
 示例:

 输入: 5
 输出:
 [
      [1],
     [1,1],
    [1,2,1],
   [1,3,3,1],
  [1,4,6,4,1]
 ]
 
 */


public func generate(_ numRows: Int) -> [[Int]] {
    guard numRows > 0 else {
        return []
    }
    var generate: [[Int]] = []
    generate.append([1])
    var i = 1
    while i < numRows {
        var list = [1]
        let lastList = generate[i - 1]
        var j = 0
        while j < lastList.count - 1 {
            let value = lastList[j] + lastList[j + 1]
            list.append(value)
            j += 1
        }
        list.append(1)
        generate.append(list)
        i += 1
    }
    return generate
}

