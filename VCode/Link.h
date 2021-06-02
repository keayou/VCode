//
//  Link.h
//  VCode
//
//  Created by fk on 2021/4/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface ListNode : NSObject

@property (nonatomic, assign) NSInteger val;
@property (nonatomic, strong, nullable) ListNode *next;


+ (instancetype)val:(NSInteger)val;

+ (instancetype)nexts:(NSArray *)array;
+ (instancetype)crate:(NSArray *)array;

@end


@interface Link : NSObject

- (ListNode *)inverseLink:(ListNode *)head;
- (ListNode *)inverseLink:(ListNode *)head interval:(NSInteger)interval;

- (ListNode *)turnRightLink:(ListNode *)head times:(int)times;

- (ListNode *)getKthFromEnd:(ListNode *)head k:(int)k;

- (ListNode *)addLink:(ListNode *)link1 toLink:(ListNode *)link2;

@end

NS_ASSUME_NONNULL_END
