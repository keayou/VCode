//
//  BinaryTree.h
//  VCode
//
//  Created by fk on 2021/4/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BinaryTreeNode : NSObject

@property (nonatomic, assign) NSInteger val;
@property (nonatomic, strong) BinaryTreeNode *left;
@property (nonatomic, strong) BinaryTreeNode *right;

+ (BinaryTreeNode *)createNodeTree:(NSArray *)array;

@end

@interface BinaryTree : NSObject

+ (NSArray *)preOrder:(BinaryTreeNode *)rootNode;
+ (NSArray *)preOrder_NotRecursion:(BinaryTreeNode *)rootNode;

+ (NSArray *)midOrder:(BinaryTreeNode *)rootNode;
+ (NSArray *)midOrder_NotRecursion:(BinaryTreeNode *)rootNode;

+ (NSArray *)postOrder:(BinaryTreeNode *)rootNode;
+ (NSArray *)levelOrder:(BinaryTreeNode *)rootNode;
+ (NSArray *)zLevelOrder:(BinaryTreeNode *)rootNode;


@end

NS_ASSUME_NONNULL_END
