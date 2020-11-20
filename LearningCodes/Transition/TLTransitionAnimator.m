//
//  TLTransitionAnimator.m
//  LearningCodes
//
//  Created by Tony on 2020/11/19.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TLTransitionAnimator.h"

@interface TLTransitionAnimator ()

@end

@implementation TLTransitionAnimator

#pragma mark - UIViewControllerAnimatedTransitioning
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
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
    
    fromView.frame = [transitionContext initialFrameForViewController:fromViewController];
    toView.frame = [transitionContext finalFrameForViewController:toViewController];
    
    // We are responsible for adding the incoming view to the containerView
    // for the presentation/dismissal.
    [containerView addSubview:toView];
    
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    
    BOOL isPresenting = (toViewController.presentingViewController == fromViewController);
    
    [self animationWithType:self.animationType
                 Presenting:isPresenting
                   FromView:fromView
                     ToView:toView
                   Duration:transitionDuration
                 completion:^(BOOL finished) {
        // When we complete, tell the transition context
        // passing along the BOOL that indicates whether the transition
        // finished or not.
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCancelled];
    }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35;
}

#pragma mark - Private
- (void)animationWithType:(TLTransitionAnimation)type
               Presenting:(BOOL)isPresenting
                 FromView:(UIView *)fromView
                   ToView:(UIView *)toView
                 Duration:(NSTimeInterval)duration
               completion:(void(^)(BOOL finished))completion {
    
    switch (type) {
        case TLTransitionAnimationDissolve: {
            fromView.alpha = 1.0f;
            toView.alpha = 0.0f;
            
            [UIView animateWithDuration:duration animations:^{
                fromView.alpha = 0.0f;
                toView.alpha = 1.0;
            } completion:^(BOOL finished) {
                if (completion) {
                    completion(finished);
                }
            }];
            break;
        }
            
        case TLTransitionAnimationSlide: {
            CGRect destFrame = toView.frame;
            UIView *opView;
            if (isPresenting) {
                CGRect origFrame = destFrame;
                origFrame.origin.x += SCREEN_WIDTH;
                toView.frame = origFrame;
                opView = toView;
            } else {
                destFrame.origin.x += SCREEN_WIDTH;
                opView = fromView;
            }
            
            [UIView animateWithDuration:duration animations:^{
                opView.frame = destFrame;
            } completion:^(BOOL finished) {
                if (completion) {
                    completion(finished);
                }
            }];
        }
            
            
        default:
            break;
    }
    
    
}

@end
