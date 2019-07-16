//
//  JMLagMonitor.h
//  LearningCodes
//
//  Created by Tony on 2019/7/15.
//  Copyright © 2019 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMLagMonitor : NSObject

+ (id)sharedInstance;

- (void)beginMonitor;
- (void)endMonitor;

@end

NS_ASSUME_NONNULL_END
