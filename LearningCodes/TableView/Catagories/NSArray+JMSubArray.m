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
    NSInteger loadTopPos;
    NSInteger loadBottomPos;
    if (cen - rad < 0) {
        range = NSMakeRange(0, cen+rad);
        newTop = cen;
        loadTopPos = 0;
        loadBottomPos = cen+rad;
    } else if (cen + rad > self.count-1) {
        range = NSMakeRange(cen-rad, self.count-1);
        newTop = rad;
        loadTopPos = cen-rad;
        loadBottomPos = self.count-1;
    } else {
        range = NSMakeRange(cen-rad, cen+rad);
        newTop = rad;
        loadTopPos = cen-rad;
        loadBottomPos = cen+rad;
    }
    
    NSArray *subArray = [self subarrayWithRange:range];
    NSDictionary *ret = @{JM_SUBARRAYKEY: subArray,
                          JM_NEWTOPKEY: @(newTop),
                          JM_LOAD_TOP_POS_KEY: @(loadTopPos),
                          JM_LOAD_BOTTOM_POS_KEY: @(loadBottomPos),
                          };
    
    return ret;
}

@end
