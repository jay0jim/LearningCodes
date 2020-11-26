//
//  TLFullScreenSwipeTransitionDelegate.m
//  LearningCodes
//
//  Created by Tony on 2020/11/26.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TLFullScreenSwipeTransitionDelegate.h"

#import "TLFullScreenSwipeAnimator.h"

@implementation TLFullScreenSwipeTransitionDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    TLFullScreenSwipeAnimator *animator = [[TLFullScreenSwipeAnimator alloc] initWithImageFrame:self.imgFrameInScreen];
    animator.type = TLTransitionTypePresent;
    return animator;
//    return nil;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    TLFullScreenSwipeAnimator *animator = [[TLFullScreenSwipeAnimator alloc] initWithImageFrame:self.imgFrameInScreen];
    animator.type = TLTransitionTypeDismiss;
    return animator;
//    return nil;
}

@end
