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

#import "TLScrollView.h"

@interface TouchTestViewController ()

@property (strong, nonatomic) TLScrollView *scrollView;

@end

@implementation TouchTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestureRecognizer:)];
    [self.view addGestureRecognizer:panGesture];
    
    [self initSubviews];
}

- (void)initSubviews {
    self.scrollView = [[TLScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.scrollView setContentSize:CGSizeMake(0, 4*SCREEN_HEIGHT)];
//    [self.scrollView setPagingEnabled:YES];
    NSArray *colorArray = @[
        [UIColor blueColor],
        [UIColor greenColor],
        [UIColor redColor],
        [UIColor yellowColor],
    ];
    for (int i = 0; i < 4; i++) {
        CGRect frame = self.scrollView.frame;
        frame.origin.y += i * SCREEN_HEIGHT;
        UIView *tempView = [[UIView alloc] initWithFrame:frame];
        tempView.backgroundColor = colorArray[i];
        [self.scrollView addSubview:tempView];
    }
    [self.view insertSubview:self.scrollView atIndex:0];
}

- (void)handlePanGestureRecognizer:(UIPanGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint vel = [gesture velocityInView:gesture.view];
        
        // 偏向竖直方向
        if (fabs(vel.x) - fabs(vel.y) < 50) {
            // 方向向下
            if (vel.y >= 0) {
                
            } else {
                
            }
        }
    }
    
    
    
}


@end
