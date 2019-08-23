//
//  NSArray+JMSubArray.m
//  LearningCodes
//
//  Created by Tony on 2019/8/23.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "NSArray+JMSubArray.h"

@implementation NSArray (JMSubArray)

- (NSDictionary *)jm_subArrayWithCenter:(NSInteger)cen Radius:(NSInteger)rad {
    NSRange range;
    NSInteger newTop;
    NSInteger loadIndex;
    if (cen - rad < 0) {
        range = NSMakeRange(0, cen+rad);
        newTop = cen;
        loadIndex = 0;
    } else if (cen + rad > self.count-1) {
        range = NSMakeRange(cen-rad, self.count-1);
        newTop = rad;
        loadIndex = cen-rad;
    } else {
        range = NSMakeRange(cen-rad, cen+rad);
        newTop = rad;
        loadIndex = cen-rad;
    }
    
    NSArray *subArray = [self subarrayWithRange:range];
    NSDictionary *ret = @{JM_SUBARRAYKEY: subArray,
                          JM_NEWTOPKEY: @(newTop),
                          JM_LOADINDEXKEY: @(loadIndex),
                          };
    
    return ret;
}

@end
