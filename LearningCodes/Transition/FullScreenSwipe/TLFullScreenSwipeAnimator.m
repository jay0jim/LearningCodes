//
//  TLFullScreenSwipeAnimator.m
//  LearningCodes
//
//  Created by Tony on 2020/11/25.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TLFullScreenSwipeAnimator.h"

#import "TransitionViewController.h"
#import "TransitionImageDetailViewController.h"
#import "JMNavigationController.h"

@implementation TLFullScreenSwipeAnimator

- (id)initWithImageFrame:(CGRect)imgFrame {
    if (self = [super init]) {
        _imgFrameInScreen = imgFrame;
    }
    return self;
}

- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    TransitionImageDetailViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    TransitionViewController *fromVC;
    if ([[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey] isKindOfClass:[JMNavigationController class]]) {
        JMNavigationController *nav = (JMNavigationController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        fromVC = nav.viewControllers.lastObject;
    } else if ([[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey] isKindOfClass:[TransitionViewController class]]) {
        fromVC = (TransitionViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    }
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    // 获取点击的按钮（图片）
    UIButton *imgButton = fromVC.imgButton;
    
    // 这里有个重要的概念containerView，
    // 如果要对视图做转场动画，视图就必须要加入containerView中才能进行，
    // 可以理解containerView管理着所有做转场动画的视图
    UIView *containerView = [transitionContext containerView];
    
    // 创建snapshot，用于转场动画
    UIView *snapshotView = [imgButton snapshotViewAfterScreenUpdates:NO];
    snapshotView.frame = self.imgFrameInScreen;
    
    // 开始动画前准备
    imgButton.hidden = YES;
    toView.alpha = 0;
    toVC.detailImageView.hidden = YES;
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    // 将toView和snapshotView添加到containerView上
    // 保证snapshotView在最上
    [containerView addSubview:toView];
    [containerView addSubview:snapshotView];
    
    [UIView animateWithDuration:duration animations:^{
        snapshotView.frame = [toVC.detailImageView convertRect:toVC.detailImageView.frame toView:containerView];
        toView.alpha = 1;
    } completion:^(BOOL finished) {
        [snapshotView removeFromSuperview];
        toVC.detailImageView.hidden = NO;
        [transitionContext completeTransition:YES];
    }];
}

- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    TransitionViewController *toVC;
    TransitionImageDetailViewController *fromVC = (TransitionImageDetailViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if ([[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey] isKindOfClass:[JMNavigationController class]]) {
        JMNavigationController *nav = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        toVC = (TransitionViewController *)nav.viewControllers.lastObject;
    } else if ([[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey] isKindOfClass:[TransitionViewController class]]) {
        toVC = (TransitionViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    }
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    // containerView
    UIView *containerView = [transitionContext containerView];
    
    // 获取按钮
    UIButton *imgButton = toVC.imgButton;
    
    // 对fromVC中的detailImageView进行截图
    UIView *snapshotView = [fromVC.detailImageView snapshotViewAfterScreenUpdates:NO];
    snapshotView.frame = [fromVC.detailImageView convertRect:fromVC.detailImageView.frame toView:containerView];
    
    // 开始动画前的准备
    fromVC.detailImageView.hidden = YES;
    [containerView addSubview:snapshotView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        snapshotView.frame = self.imgFrameInScreen;
        fromVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCancelled];
        if (wasCancelled) {
            // 手势取消，回复原来状态
            [snapshotView removeFromSuperview];
            fromVC.detailImageView.hidden = NO;
        } else {
            // 手势成功
            imgButton.hidden = NO;
            [snapshotView removeFromSuperview];
        }
    }];
    
}

#pragma mark - Animator
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.type) {
        case TLTransitionTypePresent: {
            [self presentAnimation:transitionContext];
            break;
        }
            
        case TLTransitionTypeDismiss: {
            [self dismissAnimation:transitionContext];
            break;
        }
            
        default:
            break;
    }
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}

@end
