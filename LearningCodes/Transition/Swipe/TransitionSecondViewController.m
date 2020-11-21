//
//  TransitionSecondViewController.m
//  LearningCodes
//
//  Created by Tony on 2020/11/20.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TransitionSecondViewController.h"

#import "TLTransitioningDelegate.h"

@interface TransitionSecondViewController ()

@end

@implementation TransitionSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    CGFloat barHeight = STATUSBAR_HEIGHT + 44;
    UIView *bar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, barHeight)];
    [bar setBackgroundColor:JMHexColorRGB(0xFBFBFB)];
    [self.view addSubview:bar];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [leftButton setTitle:@"Dismiss" forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(dismissButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [bar addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(bar.mas_centerY).offset(STATUSBAR_HEIGHT/2);
    }];
    
    UIScreenEdgePanGestureRecognizer *interactiveRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgeTransition:)];
    interactiveRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:interactiveRecognizer];
}

- (void)edgeTransition:(UIScreenEdgePanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self dismissButtonTapped:sender];
    }
}

- (void)dismissButtonTapped:(id)sender {
    if ([self.transitioningDelegate isKindOfClass:TLTransitioningDelegate.class]) {
        TLTransitioningDelegate *customTransitionDelegate = self.transitioningDelegate;
        
        if ([sender isKindOfClass:UIGestureRecognizer.class]) {
            customTransitionDelegate.edgeRecognizer = sender;
        } else {
            customTransitionDelegate.edgeRecognizer = nil;
        }
        
        customTransitionDelegate.edge = UIRectEdgeLeft;
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
