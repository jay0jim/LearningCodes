//
//  TLSwipeTransitionAnimator.m
//  LearningCodes
//
//  Created by Tony on 2020/11/20.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TLSwipeTransitionAnimator.h"

@implementation TLSwipeTransitionAnimator

- (id)initWithEdge:(UIRectEdge)edge {
    if (self = [super init]) {
        _edge = edge;
    }
    return self;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    
    UIView *fromView;
    UIView *toView;
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromViewController.view;
        toView = toViewController.view;
    }
    
    BOOL isPresenting = (toViewController.presentingViewController == fromViewController);
    
    CGRect fromFrame = [transitionContext initialFrameForViewController:fromViewController];
    CGRect toFrame = [transitionContext finalFrameForViewController:toViewController];
    
    CGVector offset;
    switch (self.edge) {
        case UIRectEdgeTop: {
            offset = CGVectorMake(0, 1);
            break;
        }
        case UIRectEdgeBottom: {
            offset = CGVectorMake(0, -1);
            break;
        }
        case UIRectEdgeLeft: {
            offset = CGVectorMake(1, 0);
            break;
        }
        case UIRectEdgeRight: {
            offset = CGVectorMake(-1, 0);
            break;
        }
        default:
            break;
    }// switch
    
    if (isPresenting) {
        // 如果是present则需要先把toView移除屏幕外
        fromView.frame = fromFrame;
        toView.frame = CGRectOffset(toFrame,
                                    toFrame.size.width * offset.dx * -1,
                                    toFrame.size.height * offset.dy * -1);
    } else {
        fromView.frame = fromFrame;
        toView.frame = toFrame;
    }
    
    // 把需要准备显示的view（官方文档说的是incoming view）添加到containerView
    if (isPresenting) {
        [containerView addSubview:toView];
    } else {
        // 由于滑动，所以需要把toView放到底下
        [containerView insertSubview:toView belowSubview:fromView];
    }
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        if (isPresenting) {
            toView.frame = toFrame;
        } else {
            fromView.frame = CGRectOffset(fromFrame,
                                          fromFrame.size.width * offset.dx,
                                          fromFrame.size.height * offset.dy);
        }
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        if (wasCancelled) {
            [toView removeFromSuperview];
        }
        [transitionContext completeTransition:!wasCancelled];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35;
}

@end
