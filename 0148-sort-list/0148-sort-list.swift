/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return head }
        var arr = [Int]()
        
        var head = head
        
        while head != nil {
            arr.append(head?.val ?? 0)
            head = head?.next
        }
        
        arr.sort()
        var ans = ListNode()
        head = ans
        
        while !arr.isEmpty {
            let small = arr.removeFirst()
            head?.val = small

            if !arr.isEmpty {
                let next = ListNode()
                head?.next = next 
                head = head?.next
            }
        }        

        return ans
    }
}