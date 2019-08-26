//
//  NSArray+JMSubArray.h
//  LearningCodes
//
//  Created by Tony on 2019/8/23.
//  Copyright © 2019 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JM_SUBARRAYKEY @"JMSubArrayKey"
#define JM_NEWTOPKEY @"JMNewTopKey"
#define JM_LOAD_TOP_POS_KEY @"JMLoadTopPosKey"
#define JM_LOAD_BOTTOM_POS_KEY @"JMLoadTopPosKey"

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (JMSubArray)

- (NSDictionary *)jm_subArrayWithCenter:(NSInteger)cen Radius:(NSInteger)rad;

@end

NS_ASSUME_NONNULL_END
