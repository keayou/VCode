//
//  Others.m
//  VCode
//
//  Created by fk on 2021/4/18.
//

#import "Others.h"
#import <objc/runtime.h>

@interface Others()


@end

@implementation Others

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        unsigned int count;

    //获取属性列表
        objc_property_t *propertyList = class_copyPropertyList([self class], &count);
        for (unsigned int i=0; i<count; i++) {
            const char *propertyName = property_getName(propertyList[i]);
            NSLog(@"property----="">%@", [NSString stringWithUTF8String:propertyName]);
        }
        
        //获取方法列表
        Method *methodList = class_copyMethodList([self class], &count);
        for (unsigned int i = 0; i<count; i++) {
            Method method = methodList[i];
            NSLog(@"method----="">%@", NSStringFromSelector(method_getName(method)));
        }
        
        //获取成员变量列表
        Ivar *ivarList = class_copyIvarList([self class], &count);
        for (unsigned int i = 0; i<count; i++) {
            Ivar myIvar = ivarList[i];
            const char *ivarName = ivar_getName(myIvar);
            NSLog(@"ivar----="">%@", [NSString stringWithUTF8String:ivarName]);
        }        
    }
    return self;
}

+ (Class)findLastCommonSuperClass:(Class)class1 withClass:(Class)class2
{
    if (!class1 || !class2) {
        return  Nil;
    }
    
    NSMutableArray *superClassList1 = @[].mutableCopy;
    Class temp1 = class1;
    while (temp1) {
        [superClassList1 addObject:temp1];
        temp1 = temp1.superclass;
    }
    
    NSMutableArray *superClassList2 = @[].mutableCopy;
    Class temp2 = class2;
    while (temp2) {
        [superClassList2 addObject:temp2];
        temp2 = temp2.superclass;
    }
    
    
    NSInteger count = superClassList1.count < superClassList2.count ? superClassList1.count : superClassList2.count;
    
    Class commonClass = Nil;
    
    for (NSInteger idx = 0; idx < count; idx++) {
        
        Class clz1 = superClassList1[superClassList1.count - idx - 1];
        Class clz2 = superClassList2[superClassList2.count - idx - 1];

        if (clz1 == clz2) {
            commonClass = clz1;
        } else {
            break;
        }
    }
    return commonClass;
}


// 数组内是否存在 两数之和 等于 target
+ (NSArray *)twoSum:(NSArray *)list target:(NSInteger)target
{
    if (list.count < 2) {
        return @[];
    }
    
    NSMutableArray *resultList = @[].mutableCopy;
    NSMutableDictionary *tempDict = @{}.mutableCopy;
    
    for (NSInteger idx = 0; idx < list.count; idx++) {
        
        NSInteger num = [list[idx] intValue];
        NSInteger aa = target - num;
        
        if (tempDict[@(aa)]) {
            NSInteger preIndex = [tempDict[@(aa)] integerValue];
            [resultList addObject:[NSString stringWithFormat:@"%ld_%ld", preIndex , idx]];
        } else {
            tempDict[@(num)] = @(idx);
        }
    }
    return resultList.copy;
}


+ (NSString *)invertString:(NSString *)originStr
{
    if (!originStr || originStr.length <= 1) {
        return originStr;
    }
    
    NSString *resultStr = @"";
    
    NSInteger loc = originStr.length - 1;
    while (loc >= 0) {
        
        NSString *curChar = [originStr substringWithRange:NSMakeRange(loc, 1)];
        resultStr = [resultStr stringByAppendingString:curChar];
        loc--;
    }
    return resultStr;
}

@end
