//
//  JMLagMonitor.m
//  LearningCodes
//
//  Created by Tony on 2019/7/15.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "JMLagMonitor.h"

@interface JMLagMonitor () {
    // 用semaphore来检测每个状态是否有超过延时阈值
    // 在observer的block中进行signal，在子线程的循环中wait
    // 具体原理为先设置sema为0，这样当循环执行时就会进入wait状态，然后当observer改变状态时就会进行signal，如果wait的时间超过延时阈值，则报告，如果无，则进行下一次操作。
    dispatch_semaphore_t jm_sema;
    
    CFRunLoopObserverRef jm_observer;
    CFRunLoopActivity jm_activity;
}

@end

@implementation JMLagMonitor

+ (id)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[JMLagMonitor alloc] init];
    });
    return sharedInstance;
}

- (void)beginMonitor {
    
    if (jm_observer) {
        return;
    }
    
    // semaphore
    jm_sema = dispatch_semaphore_create(0);
    
    // observer
    CFRunLoopObserverContext context = {0,(__bridge void*)self,NULL,NULL};
    jm_observer = CFRunLoopObserverCreate(kCFAllocatorDefault,
                                              kCFRunLoopAllActivities,
                                              YES,
                                              0,
                                              &runLoopObserverCallBack,
                                              &context);
//    jm_observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//        self->jm_activity = activity;
//        dispatch_semaphore_signal(self->jm_sema);
//    });
    // 将observer添加到主线程的common模式
    CFRunLoopAddObserver(CFRunLoopGetMain(), jm_observer, kCFRunLoopCommonModes);
    
    // 创建子线程监控
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        while (YES) {
//            NSLog(@"while...");
            long semaWait = dispatch_semaphore_wait(self->jm_sema, dispatch_time(DISPATCH_TIME_NOW, 20*NSEC_PER_SEC));
            if (semaWait != 0) {
                if (!self->jm_observer) {
                    return ;
                }

                if (self->jm_activity == kCFRunLoopBeforeSources || self->jm_activity == kCFRunLoopAfterWaiting) {
                    NSLog(@"Lagging Detected!");
                    // 其他操作...
                }
            }// if semaWait
        }
    });
    
    
}

- (void)endMonitor {
    if (!jm_observer) {
        return;
    }
    CFRunLoopRemoveObserver(CFRunLoopGetMain(), jm_observer, kCFRunLoopCommonModes);
    CFRelease(jm_observer);
    jm_observer = NULL;
    
}

- (void)monitorOnThread {
    
}

static void runLoopObserverCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    JMLagMonitor *lagMonitor = (__bridge JMLagMonitor*)info;
    lagMonitor->jm_activity = activity;
    
    dispatch_semaphore_t semaphore = lagMonitor->jm_sema;
    dispatch_semaphore_signal(semaphore);
}

@end
