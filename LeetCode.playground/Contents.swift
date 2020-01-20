import Foundation

[1, 2].reduce(0) { (result, item) -> Int in
    return result + item
}

[1, 2].reduce(into: 0) { (result, item) in
    result += item
}
