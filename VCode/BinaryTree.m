//
//  BinaryTree.m
//  VCode
//
//  Created by fk on 2021/4/17.
//

#import "BinaryTree.h"


@implementation BinaryTreeNode

+ (instancetype)creatrTreeNode:(NSInteger)val
{
    BinaryTreeNode *node = [BinaryTreeNode new];
    node.val = val;
    return node;
}
+ (BinaryTreeNode *)createNodeTree:(NSArray *)array
{
    if (array.count<=0) {
        return nil;
    }
    int i;
    int n = (int)array.count;
    NSMutableArray * treesM = [NSMutableArray array];
    for (i = 0; i<n; i++) {
        int val = [array[i] intValue];
        BinaryTreeNode * p = [BinaryTreeNode creatrTreeNode:val];
        [treesM addObject:p];
    }
    int m = n/2-1;
    for (i=0; i<=m; i++) {//原来的父亲节点范围为1~n/2,现在0~n/2-1,所以注意n/2要取到等
        if (2*i+1<=n-1) {
            BinaryTreeNode * p = treesM[i];
            BinaryTreeNode *temp = treesM[2*i+1]; //把第2*i+1个结点的地址赋给左孩子
            if (temp.val != -1) {
                p.left = temp;
            }
            
        }
        if (2*i+2<=n-1){
            BinaryTreeNode * p = treesM[i];
            BinaryTreeNode *temp = treesM[2*i+2]; //把第2*i+1个结点的地址赋给右孩子
            if (temp.val != -1) {
                p.right = temp;
            }
        }
    }
    return treesM.firstObject;
}

@end

@implementation BinaryTree

+ (NSArray *)preOrder:(BinaryTreeNode *)rootNode
{
    if (!rootNode) {
        return @[];
    }
    
    NSMutableArray *list = @[].mutableCopy;
    [list addObject:rootNode];
    [list addObjectsFromArray:[self preOrder:rootNode.left]];
    [list addObjectsFromArray:[self preOrder:rootNode.right]];
    
    return list.copy;
}

+ (NSArray *)preOrder_NotRecursion:(BinaryTreeNode *)rootNode
{
    if (!rootNode) {
        return @[];
    }
    
    NSMutableArray *resultList = @[].mutableCopy;
    NSMutableArray *tempList = @[].mutableCopy;
    BinaryTreeNode *qNode = rootNode;

    while (qNode || tempList.count > 0) {
        
        if (qNode) {
            [resultList addObject:qNode];
            
            [tempList addObject:qNode];
            qNode = qNode.left;
        } else {
            
            BinaryTreeNode *temp = tempList.lastObject;
            [tempList removeLastObject];
            qNode = temp.right;
        }
    }
    return resultList.copy;
}


+ (NSArray *)midOrder:(BinaryTreeNode *)rootNode
{
    if (!rootNode) {
        return @[];
    }
    
    NSMutableArray *list = @[].mutableCopy;
    [list addObjectsFromArray:[self midOrder:rootNode.left]];
    [list addObject:rootNode];
    [list addObjectsFromArray:[self midOrder:rootNode.right]];
    
    return list.copy;
}

+ (NSArray *)midOrder_NotRecursion:(BinaryTreeNode *)rootNode
{
    if (!rootNode) {
        return @[];
    }
    
    NSMutableArray *resultList = @[].mutableCopy;
    NSMutableArray *tempList = @[].mutableCopy;
    BinaryTreeNode *qNode = rootNode;

    while (qNode || tempList.count > 0) {
        
        if (qNode) {
            [tempList addObject:qNode];
            qNode = qNode.left;
        } else {
            
            BinaryTreeNode *temp = tempList.lastObject;
            [resultList addObject:temp];

            [tempList removeLastObject];
            qNode = temp.right;
        }
    }
    return resultList.copy;
}

+ (NSArray *)postOrder:(BinaryTreeNode *)rootNode
{
    if (!rootNode) {
        return @[];
    }
    NSMutableArray *list = @[].mutableCopy;
    [list addObjectsFromArray:[self postOrder:rootNode.left]];
    [list addObjectsFromArray:[self postOrder:rootNode.right]];
    [list addObject:rootNode];

    return list.copy;
}


+ (NSArray *)levelOrder:(BinaryTreeNode *)rootNode
{
    if (!rootNode) {
        return @[];
    }
    NSMutableArray *resultList = @[].mutableCopy;
    
    NSMutableArray *tempList = @[].mutableCopy;
    [tempList addObject:rootNode];
    
    while (tempList.count > 0) {
        
        BinaryTreeNode *curNode = tempList.firstObject;
        [resultList addObject:curNode];
        
        [tempList removeObjectAtIndex:0];
        if (curNode.left) {
            [tempList addObject:curNode.left];
        }
        if (curNode.right) {
            [tempList addObject:curNode.right];
        }
    }
    return resultList.copy;
}

+ (NSArray *)zLevelOrder:(BinaryTreeNode *)rootNode
{
    if (!rootNode) {
        return @[];
    }
    
    NSMutableArray *resultList = @[].mutableCopy;
    
    NSMutableArray *left2RightList = @[].mutableCopy;
    NSMutableArray *right2LeftList = @[].mutableCopy;
    
    [left2RightList addObject:rootNode];
    
    BOOL isLeft2Right = YES;
    
    while (left2RightList.count > 0 || right2LeftList.count > 0) {
        
        if (isLeft2Right) {
            
            if (left2RightList.count <= 0) {
                isLeft2Right = NO;
                continue;
            }
            
            BinaryTreeNode *node = left2RightList.firstObject;
            [resultList addObject:node];
            
            [left2RightList removeObjectAtIndex:0];
            if (node.left) {
                [right2LeftList addObject:node.left];
            }
            if (node.right) {
                [right2LeftList addObject:node.right];
            }
        } else {
            
            if (right2LeftList.count <= 0) {
                isLeft2Right = YES;
                continue;
            }
            
            BinaryTreeNode *node = right2LeftList.lastObject;
            [resultList addObject:node];
            
            [right2LeftList removeObjectAtIndex:right2LeftList.count - 1];
            if (node.right) {
                [left2RightList insertObject:node.right atIndex:0];
            }
            if (node.left) {
                [left2RightList insertObject:node.left atIndex:0];
            }
        }
    }
    return resultList.mutableCopy;
}




@end
