//
//  Search.m
//  VCode
//
//  Created by fk on 2021/4/17.
//

#import "Search.h"

@implementation Search

+ (NSInteger)binarySearch:(NSArray *)numList targetNum:(NSInteger)target
{
    if (numList.count <= 0) {
        return  -1;
    }
    // target 3
    // 0 1 2 3 4 5 6 7 8
    NSInteger leftIdx = 0;
    NSInteger rightIdx = numList.count - 1;
    
    while (leftIdx != rightIdx) {
        
        NSInteger mid = (rightIdx + leftIdx) / 2;
        NSInteger num = [numList[mid] integerValue];
        
        if (num > target) {
            rightIdx = mid - 1;
        } else if (num < target) {
            leftIdx = mid + 1;
        } else {
            return mid;
        }
    }
    return -1;
}

@end
