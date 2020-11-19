//
//  TransitionViewController.m
//  LearningCodes
//
//  Created by Tony on 2020/11/11.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TransitionViewController.h"

#import "TLTransitionAnimator.h"
#import "TransitonFirstViewController.h"


@interface TransitionViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

- (IBAction)standardTransition:(id)sender {
    TransitonFirstViewController *firstVC = [[TransitonFirstViewController alloc] init];
    firstVC.transitioningDelegate = self;
    firstVC.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:firstVC animated:YES completion:^{

    }];
//    [self.navigationController pushViewController:firstVC animated:YES];
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [TLTransitionAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [TLTransitionAnimator new];
}

@end
