//
//  DivideAndConquer.swift
//  VCode
//
//  Created by fk on 2021/6/3.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class DivideAndConquerSolution {
    
    @objc public func solution() {

        let ds = [1,3,1,1,4,1,1,5,1,1,6,2,2]
        let _ = majorityElement(ds)
    }
    
    
    /*
     给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。
     你可以假设数组是非空的，并且给定的数组总是存在多数元素。
     
     时间复杂度 O(n)  空间复杂度 O(1)
     
     链接：https://leetcode-cn.com/problems/majority-element
     */
    func majorityElement(_ nums: [Int]) -> Int {

        var cur = nums[0]
        var count = 1

        for idx in 1..<nums.count {
            
            let num = nums[idx]

            if num == cur {
                count += 1
            } else {
                count -= 1
                if count == 0 {
                     cur = nums[idx + 1]
                }
            }
        }
        return cur
    }
    
    
    /*
     输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。
     
     示例1：
     输入：1->2->4, 1->3->4
     输出：1->1->2->3->4->4

     链接：https://leetcode-cn.com/problems/he-bing-liang-ge-pai-xu-de-lian-biao-lcof
     */
    
    class Solution {
        func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            var node1 = l1
            var node2 = l2
            
            var node :ListNode? = ListNode.init(0)
            let head = node

            while node1 != nil && node2 != nil {
                
                if node1!.val < node2!.val {
                    node?.next = node1
                    node1 = node1?.next
                } else {
                    node?.next = node2
                    node2 = node2?.next
                }
                node = node?.next
            }
            if node1 != nil {
                node?.next = node1
            }
            if node2 != nil {
                node?.next = node2
            }
            return head?.next
        }
    }
}
