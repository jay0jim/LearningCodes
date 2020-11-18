//
//  TouchTestViewController.m
//  LearningCodes
//
//  Created by Tony on 2020/11/13.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TouchTestViewController.h"

#import "TLViewA.h"
#import "TLViewB.h"

@interface TouchTestViewController ()

@end

@implementation TouchTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    TLViewA *viewA = [[TLViewA alloc] initWithFrame:CGRectMake(100, 200, 200, 170)];
    viewA.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewA];
    
//    TLViewB *viewB = [[TLViewB alloc] initWithFrame:CGRectMake(-50, -100, 200, 170)];
//    viewB.backgroundColor = [UIColor blueColor];
//    viewB.alpha = 0.8;
//    [viewA addSubview:viewB];
}


@end
