//
//  TransitonFirstViewController.m
//  LearningCodes
//
//  Created by Tony on 2020/11/19.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TransitonFirstViewController.h"

#import "TLScrollView.h"


@interface TransitonFirstViewController ()

@property (strong, nonatomic) TLScrollView *tl_scrollView;


@end

@implementation TransitonFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat barHeight = STATUSBAR_HEIGHT + 44;
    UIView *bar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, barHeight)];
    [bar setBackgroundColor:JMHexColorRGB(0xFBFBFB)];
    [self.view addSubview:bar];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [leftButton setTitle:@"Dismiss" forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(dismissButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [bar addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(bar.mas_centerY).offset(STATUSBAR_HEIGHT/2);
    }];

    self.tl_scrollView = [[TLScrollView alloc] initWithFrame:self.view.frame];
    self.tl_scrollView.contentInset = UIEdgeInsetsMake(barHeight, 0, 0, 0);
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
    [self.view insertSubview:self.tl_scrollView atIndex:0];
    
}

- (void)dismissButtonTapped {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
