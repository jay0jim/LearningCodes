//
//  SerialTest+SerialEnsure.m
//  LearningCodes
//
//  Created by Tony on 2019/7/15.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "SerialTest+SerialEnsure.h"

@implementation SerialTest (SerialEnsure)

- (void)doSomethingWithCompletionHandler:(STCompletion)handler
                            ensureFinish:(EnsureCompletion) ensureHandler {
    return [self doSomethingWithCompletionHandler:^{
        if (handler) {
            handler();
        }
        
        Ivar queueIvar = class_getInstanceVariable([SerialTest class], "_queue");
        dispatch_queue_t newQueue = nil;
        if (queueIvar) {
            newQueue = object_getIvar([SerialTest sharedInstance], queueIvar);
//            NSLog(@"%@", self.queue);
        }
        
        dispatch_async(newQueue, ^{
            if (ensureHandler) {
                ensureHandler();
            }
            
        });
    }];
}

@end
