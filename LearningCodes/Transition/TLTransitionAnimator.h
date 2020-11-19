//
//  TLTransitionAnimator.h
//  LearningCodes
//
//  Created by Tony on 2020/11/19.
//  Copyright © 2020 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    TLTransitionAnimationDissolve,
} TLTransitionAnimation;

@interface TLTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (assign, nonatomic) TLTransitionAnimation animationType;

@end

NS_ASSUME_NONNULL_END
