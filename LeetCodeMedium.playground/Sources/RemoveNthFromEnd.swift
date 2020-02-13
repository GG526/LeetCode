import Foundation

/*
 
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

 示例：

 给定一个链表: 1->2->3->4->5, 和 n = 2.

 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 说明：

 给定的 n 保证是有效的。

 进阶：

 你能尝试使用一趟扫描实现吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


public func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dumy: ListNode? = ListNode(0)
    var fast = dumy, slow = dumy
    dumy?.next = head
    var i = 1
    while i <= n + 1 {
        fast = fast?.next
        i += 1
    }
    while fast != nil {
        slow = slow?.next
        fast = fast?.next
    }
    slow?.next = slow?.next?.next
    return dumy?.next
    
}
