//
//  Others.h
//  VCode
//
//  Created by fk on 2021/4/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Others : NSObject

@property (nonatomic, strong, readonly) NSString *str;

+ (Class)findLastCommonSuperClass:(Class)class1 withClass:(Class)class2;

+ (NSArray *)twoSum:(NSArray *)list target:(NSInteger)target;

@end

NS_ASSUME_NONNULL_END
