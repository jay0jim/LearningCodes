//
//  TLTransitioningDelegate.m
//  LearningCodes
//
//  Created by Tony on 2020/11/20.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TLTransitioningDelegate.h"

#import "TLSwipeTransitionAnimator.h"
#import "TLSwipeTransitionInteractionController.h"

@implementation TLTransitioningDelegate

#pragma mark - 基础present/dismiss
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    TLSwipeTransitionAnimator *animator = [[TLSwipeTransitionAnimator alloc] initWithEdge:UIRectEdgeRight];
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    TLSwipeTransitionAnimator *animator = [[TLSwipeTransitionAnimator alloc] initWithEdge:UIRectEdgeLeft];
    return animator;
}

#pragma mark - 交互式（interactivity）还需要多实现这两个方法
- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator {
    if (self.edgeRecognizer) {
        return [[TLSwipeTransitionInteractionController alloc] initWithGestureRecognizer:self.edgeRecognizer edge:self.edge];
    } else {
        return nil;
    }
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    if (self.edgeRecognizer) {
        return [[TLSwipeTransitionInteractionController alloc] initWithGestureRecognizer:self.edgeRecognizer edge:self.edge];
    } else {
        return nil;
    }
}

@end
