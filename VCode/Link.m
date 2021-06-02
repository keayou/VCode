//
//  Link.m
//  VCode
//
//  Created by fk on 2021/4/17.
//

#import "Link.h"


@implementation ListNode

+ (instancetype)val:(NSInteger)val
{
    ListNode *node = [ListNode new];
    node.val = val;
    return node;
}

+ (instancetype)nexts:(NSArray *)array
{
    ListNode *head = [ListNode new];
    ListNode *temp = head;
    
    for (NSInteger idx = 0; idx < array.count; idx++) {
        while (temp.next) {
            temp = temp.next;
        }
        temp.val = [array[idx] integerValue];
        if (idx != array.count - 1) {
   
            ListNode *next = [ListNode new];
      
            temp.next = next;
            temp = next;
        }
    }
    return head;
}

+ (instancetype)crate:(NSArray *)array
{
    ListNode *head = [ListNode new];
    ListNode *temp = head;
    
    for (int idx = 0; idx < array.count; idx++) {
        
        NSInteger val = [array[idx] integerValue];
        ListNode *node = [ListNode val:val];
        while (temp.next) {
            temp = temp.next;
        }
        temp.next = node;
        temp = node;
    }
    return head.next;
}

@end


@implementation Link

- (ListNode *)inverseLink:(ListNode *)head
{
    if (!head || !head.next) {
        return head;
    }
    
    ListNode *pre = head;
    ListNode *cur = pre.next;
    ListNode *next = cur.next;
    pre.next = nil;
    
    while (cur) {
        cur.next = pre;
        pre = cur;
        cur = next;
        next = cur.next;
    }
    return pre;
}

- (ListNode *)inverseLink:(ListNode *)head interval:(NSInteger)interval
{
    if (!head || !head.next || interval <= 1) {
        return head;
    }
    
    NSInteger count = 0;
        
    ListNode *vNode = [ListNode new];
    vNode.next = head;
    
    ListNode *pre = vNode;
    ListNode *cur = pre.next;
    while (cur) {
        
        count++;
        if (count >= interval) {
            
            ListNode *next = cur.next;
            cur.next = nil;
            
            ListNode *start = pre.next;
            ListNode *node = [self inverseLink:start];
            pre.next = node;

            pre = start;
            cur = next;
            pre.next = cur;
            
            count = 0;
            continue;
        }
        cur = cur.next;
    }
    return vNode.next;
}

- (ListNode *)turnRightLink:(ListNode *)head times:(int)times
{
    if (!head || !head.next) {
        return head;
    }
    
    NSInteger linkLength = 0;
    
    ListNode *temp = head;
    while (temp) {
        linkLength++;
        temp = temp.next;
    }
    
    NSInteger turnCount = times % linkLength;
    NSInteger count = 0;

    ListNode *tail = nil;
    ListNode *leftNode = head;
    ListNode *rightNode = head;
    
    while (rightNode) {
        
        if (rightNode.next == nil) {
            tail = rightNode;
        }
        
        rightNode = rightNode.next;
        if (count <= turnCount) {
            count++;
        } else {
            leftNode = leftNode.next;
        }
    }
    
    ListNode *reNode = leftNode.next;
    leftNode.next = nil;
    
    tail.next = head;
    return reNode;
}

- (ListNode *)getKthFromEnd:(ListNode *)head k:(int)k
{
    return [ListNode new];
}

- (ListNode *)addLink:(ListNode *)link1 toLink:(ListNode *)link2
{
    return [ListNode new];
}

@end
