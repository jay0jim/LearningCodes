//
//  SerialTest.m
//  LearningCodes
//
//  Created by Tony on 2019/7/15.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "SerialTest.h"

@interface SerialTest ()

@property (strong, nonatomic) dispatch_queue_t queue;

@end

@implementation SerialTest

+ (id)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SerialTest alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.queue = dispatch_queue_create("testQueueSerial", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)doSomethingWithCompletionHandler:(STCompletion)handler {
    NSLog(@"Doing Something...");
    dispatch_async(self.queue, ^{
        NSLog(@"sleep for 2 sec...");
        [NSThread sleepForTimeInterval:2.0];
        
    });
    if (handler) {
        handler();
    }
}

@end
