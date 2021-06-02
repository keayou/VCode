//
//  ViewController.m
//  VCode
//
//  Created by fk on 2021/1/15.
//

#import "ViewController.h"
#import "ResidentThreadTestView.h"
#import "Search.h"
#import "BinaryTree.h"
#import "Link.h"
#import "Others.h"
#import <objc/runtime.h>
#import "VCode-Swift.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *list = [ArraySolution twoSum:@[@1, @4, @3, @6] :9];
    NSArray *lis22t = [ArraySolution generate:5];
    
    // 常驻线程
    ResidentThreadTestView *residentThreadTestView = [[ResidentThreadTestView alloc] init];
    residentThreadTestView.userInteractionEnabled = YES;
    residentThreadTestView.text = @"ResidentThreadTestView";
    residentThreadTestView.backgroundColor = [UIColor yellowColor];
    [residentThreadTestView sizeToFit];
    residentThreadTestView.frame = CGRectMake(10, 100, residentThreadTestView.bounds.size.width, residentThreadTestView.bounds.size.height + 40);
    [self.view addSubview:residentThreadTestView];
    
    
    [self search];
    
    [self binaryTree];

    [self linkHandle];
    
    [self othersHandle];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
}

#pragma mark - 二叉树
- (void)binaryTree
{
    //                   12
    //          14                5
    //     66       77         32   25
    //  88   55  35    90
    
    BinaryTreeNode *node = [BinaryTreeNode createNodeTree:@[@(12),@(14),@(5),@(66),@(77),@(32),@(25),@(88),@(55),@(35),@(90)]];

    // 二叉树先序遍历
    NSArray *preOrderList = [BinaryTree preOrder:node];
    NSArray *res = [preOrderList valueForKeyPath:@"val"];
    NSString *resultStr = [res componentsJoinedByString:@"_"];
    NSLog(@" BinaryTree preOrder : %@", resultStr);
    
    // 二叉树先序遍历 非递归
    NSArray *preNotRecursionList = [BinaryTree preOrder_NotRecursion:node];
    NSArray *resNotRecursion = [preNotRecursionList valueForKeyPath:@"val"];
    NSString *resultStrNotRecursion = [resNotRecursion componentsJoinedByString:@"_"];
    NSLog(@" BinaryTree preOrder_NotRecursion : %@", resultStrNotRecursion);
    
    
    // 二叉树中序遍历
    NSArray *midOrderList = [BinaryTree midOrder:node];
    NSArray *midOrderres = [midOrderList valueForKeyPath:@"val"];
    NSString *midOrderResultStr = [midOrderres componentsJoinedByString:@"_"];
    NSLog(@" BinaryTree midOrder : %@", midOrderResultStr);
    
    // 二叉树中序遍历 非递归
    NSArray *midNotRecursionList = [BinaryTree midOrder_NotRecursion:node];
    NSArray *midNotRecursionres = [midNotRecursionList valueForKeyPath:@"val"];
    NSString *midNotRecursionResultStr = [midNotRecursionres componentsJoinedByString:@"_"];
    NSLog(@" BinaryTree midOrder_NotRecursion : %@", midNotRecursionResultStr);
    
        
    // 二叉树后序遍历
    NSArray *postOrderList = [BinaryTree postOrder:node];
    NSArray *postOrderres = [postOrderList valueForKeyPath:@"val"];
    NSString *postOrderresultStr = [postOrderres componentsJoinedByString:@"_"];
    NSLog(@" BinaryTree postOrder : %@", postOrderresultStr);
    
    // 二叉树层序遍历
    NSArray *levelOrderList = [BinaryTree levelOrder:node];
    NSArray *levelOrderRes = [levelOrderList valueForKeyPath:@"val"];
    NSString *levelOrderResultStr = [levelOrderRes componentsJoinedByString:@"_"];
    NSLog(@" BinaryTree levelOrder : %@", levelOrderResultStr);
    
    // 二叉树 Z 层序遍历
    NSArray *zLevelOrderList = [BinaryTree zLevelOrder:node];
    NSArray *zLevelOrderRes = [zLevelOrderList valueForKeyPath:@"val"];
    NSString *zLevelOrderResultStr = [zLevelOrderRes componentsJoinedByString:@"_"];
    NSLog(@" BinaryTree zLevelOrder : %@", zLevelOrderResultStr);
}

#pragma mark - 链表
- (void)linkHandle
{
    Link *linkIns = [Link new];
    
    // 链表反转
    ListNode *inverseLinkNode = [ListNode nexts:@[@2,@4,@5,@6,@8,@3,@56,@99,@25,@14,@45]];
    ListNode *inverseLink = [linkIns inverseLink:inverseLinkNode];
    NSString *inverseLinkStr = @"";
    while (inverseLink) {
        inverseLinkStr = [inverseLinkStr stringByAppendingFormat:@"-%ld",(long)inverseLink.val];
        inverseLink = inverseLink.next;
    }
    NSLog(@" inverseLink : %@", inverseLinkStr);
    
    // 链表间隔反转
    ListNode *inverseLink_intervalNode = [ListNode nexts:@[@2,@4,@5,@6,@8,@3,@56,@99,@25,@14,@45]];
    ListNode *inverseLink_interval = [linkIns inverseLink:inverseLink_intervalNode interval:3];
    NSString *inverseLink_intervalStr = @"";
    while (inverseLink_interval) {
        inverseLink_intervalStr = [inverseLink_intervalStr stringByAppendingFormat:@"-%ld",(long)inverseLink_interval.val];
        inverseLink_interval = inverseLink_interval.next;
    }
    NSLog(@" inverseLink_interval : %@", inverseLink_intervalStr);

    // 链表向右移动 k 次
    ListNode *inverseLink_turnRightNode = [ListNode nexts:@[@2,@4,@5,@6,@8,@3,@56,@99,@25,@14,@45]];
    ListNode *inverseLink_turnRight = [linkIns turnRightLink:inverseLink_turnRightNode times:3];
    NSString *inverseLink_turnRightStr = @"";
    while (inverseLink_turnRight) {
        inverseLink_turnRightStr = [inverseLink_turnRightStr stringByAppendingFormat:@"-%ld",(long)inverseLink_turnRight.val];
        inverseLink_turnRight = inverseLink_turnRight.next;
    }
    NSLog(@" inverseLink_turnRight : %@", inverseLink_turnRightStr);
}


#pragma mark - 查找
- (void)search
{
    //二分查找
    NSInteger binarySearchResut = [Search binarySearch:@[@1, @12, @13, @14, @15, @16, @18, @19, @20, @50, @100] targetNum:16];
    NSLog(@" binarySearchResut is %@ ", binarySearchResut != -1 ? @"Success" : @"Failed");
}

#pragma mark - 其他
- (void)othersHandle
{
    // 寻找最近公共父类
    Class clz = [Others findLastCommonSuperClass:UIView.class withClass:UILabel.class];
    NSLog(@" CommonSuperClass found %@ : %@", clz ? @"Success" :  @"Failed", NSStringFromClass(clz));
    
    // 数组内是否存在 两数之和 等于 target
    NSArray *twoSumList = [Others twoSum:@[@12, @2, @3, @4, @5, @0] target:5];
    NSLog(@"twoSum result %@ ", twoSumList);
}



@end
