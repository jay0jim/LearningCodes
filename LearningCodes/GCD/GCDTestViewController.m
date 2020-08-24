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

#import <pthread.h>
#import <ReactiveObjC.h>

typedef void(^testBlock)(void);
@interface BlockTest : NSObject

@property (copy, nonatomic) testBlock block;

@end

@implementation BlockTest

@end

@interface GCDTestViewController () {

}

@property (strong, nonatomic) BlockTest *bt;

@end

@implementation GCDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"GCDTest";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.bt = [[BlockTest alloc] init];
    
    @weak(self);
    self.bt.block = ^{
        @strong(self)
        if (self) {
            [self myPrint];
        } else {
            
        }
    };
    
    self.bt.block();
    
}

- (void)myPrint {
    NSLog(@"my print...");
}

- (void)dealloc {
    NSLog(@"GCDTestViewController dealloc...");
}

@end
