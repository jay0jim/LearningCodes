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
        
        // test
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([SerialTest class], &count);
        for (int i = 0; i < count; i++) {
            const char *varName = ivar_getName(ivars[i]);
            NSString *name = [NSString stringWithUTF8String:varName];
            id varValue = object_getIvar([SerialTest sharedInstance], ivars[i]);
            id varValue2 = [[SerialTest sharedInstance] valueForKey:name];
            NSLog(@"\nName: %@\nValue1: %@\nValue2: %@", name, varValue, varValue2);
        }
        free(ivars);
        
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
