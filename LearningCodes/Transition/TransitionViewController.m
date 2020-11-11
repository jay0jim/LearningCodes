//
//  TransitionViewController.m
//  LearningCodes
//
//  Created by Tony on 2020/11/11.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TransitionViewController.h"

#import "TLScrollView.h"

@interface TransitionViewController ()

@property (strong, nonatomic) TLScrollView *tl_scrollView;

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tl_scrollView = [[TLScrollView alloc] initWithFrame:self.view.frame];
    [self.tl_scrollView setContentSize:CGSizeMake(4*SCREEN_WIDTH, 0)];
    [self.tl_scrollView setPagingEnabled:YES];
    NSArray *colorArray = @[
        [UIColor blueColor],
        [UIColor greenColor],
        [UIColor redColor],
        [UIColor yellowColor],
    ];
    for (int i = 0; i < 4; i++) {
        CGRect frame = self.tl_scrollView.frame;
        frame.origin.x += i * SCREEN_WIDTH;
        UIView *tempView = [[UIView alloc] initWithFrame:frame];
        tempView.backgroundColor = colorArray[i];
        [self.tl_scrollView addSubview:tempView];
    }
    [self.view addSubview:self.tl_scrollView];
    
    
}


@end
