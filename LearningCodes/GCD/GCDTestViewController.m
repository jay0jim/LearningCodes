//
//  GCDTestViewController.m
//  LearningCodes
//
//  Created by Tony on 2019/7/15.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "GCDTestViewController.h"
#import "SerialTest.h"
#import "SerialTest+SerialEnsure.h"

@interface GCDTestViewController ()


@end

@implementation GCDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"GCDTest";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [[SerialTest sharedInstance] doSomethingWithCompletionHandler:^{
//        NSLog(@"Awake!");
//    }];
    
    [[SerialTest sharedInstance] doSomethingWithCompletionHandler:^{
        NSLog(@"Awake!");
    } ensureFinish:^{
        NSLog(@"Real awake~!");
    }];
    
//    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(queue, ^{
//        NSLog(@"11111");
//        [NSThread sleepForTimeInterval:2];
//        NSLog(@"1----");
//    });
//
//    dispatch_async(queue, ^{
//        NSLog(@"22222");
//    });
}



@end
