//
//  TransitionViewController.m
//  LearningCodes
//
//  Created by Tony on 2020/11/11.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TransitionViewController.h"

#import "TLTransitionAnimator.h"
#import "TLSwipeTransitionAnimator.h"
#import "TransitonFirstViewController.h"
#import "TransitionSecondViewController.h"
#import "TLTransitioningDelegate.h"

@interface TransitionViewController () <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) TLTransitioningDelegate *transitionDelegate;

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScreenEdgePanGestureRecognizer *interactiveRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgeTransition:)];
    interactiveRecognizer.edges = UIRectEdgeRight;
    [self.view addGestureRecognizer:interactiveRecognizer];
    
}

- (TLTransitioningDelegate *)transitionDelegate {
    if (_transitionDelegate == nil) {
        _transitionDelegate = [[TLTransitioningDelegate alloc] init];
    }
    return _transitionDelegate;
}

- (IBAction)standardTransition:(id)sender {
    TransitonFirstViewController *firstVC = [[TransitonFirstViewController alloc] init];
    firstVC.transitioningDelegate = self;
    firstVC.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:firstVC animated:YES completion:^{

    }];
//    [self.navigationController pushViewController:firstVC animated:YES];
}

- (void)edgeTransition:(UIScreenEdgePanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self edgeTransitionButtonTapped:sender];
    }
}

- (IBAction)edgeTransitionButtonTapped:(id)sender {
    TransitionSecondViewController *secondVC = [[TransitionSecondViewController alloc] init];
    
    // 设置转场代理
    TLTransitioningDelegate *customTransitionDelegate = self.transitionDelegate;
    if ([sender isKindOfClass:UIScreenEdgePanGestureRecognizer.class]) {
        customTransitionDelegate.edgeRecognizer = sender;
    } else {
        customTransitionDelegate.edgeRecognizer = nil;
    }
    customTransitionDelegate.edge = UIRectEdgeRight;
    secondVC.transitioningDelegate = customTransitionDelegate;
    secondVC.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:secondVC animated:YES completion:^{
        
    }];
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    TLSwipeTransitionAnimator *animator = [[TLSwipeTransitionAnimator alloc] initWithEdge:UIRectEdgeRight];
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    TLSwipeTransitionAnimator *animator = [[TLSwipeTransitionAnimator alloc] initWithEdge:UIRectEdgeLeft];
    return animator;
}

@end
