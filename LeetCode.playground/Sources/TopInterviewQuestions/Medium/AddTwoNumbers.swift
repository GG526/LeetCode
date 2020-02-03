import Foundation

/*
 
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例：

 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807

 
 */

public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var carryBit = 0
    var l1 = l1
    var l2 = l2
    var head: ListNode?
    var first: ListNode?
    while l1 != nil || l2 != nil {
        let value = (l1?.val ?? 0) + (l2?.val ?? 0) + carryBit
        carryBit = value / 10
        let node = ListNode(value % 10)
        if head == nil {
            head = node
            first = head
        } else {
            head?.next = node
        }
        head = node
        l1 = l1?.next
        l2 = l2?.next
    }
    if carryBit != 0 {
        head?.next = ListNode(carryBit)
    }
    return first
}
