//
//  SerialTest.h
//  LearningCodes
//
//  Created by Tony on 2019/7/15.
//  Copyright © 2019 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^STCompletion)(void);

@interface SerialTest : NSObject

@property (strong, nonatomic) dispatch_queue_t queue;

+ (id)sharedInstance;

- (void)doSomethingWithCompletionHandler:(STCompletion) handler;

@end

NS_ASSUME_NONNULL_END
