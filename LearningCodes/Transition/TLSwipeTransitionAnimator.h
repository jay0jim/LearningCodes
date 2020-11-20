//
//  TLSwipeTransitionAnimator.h
//  LearningCodes
//
//  Created by Tony on 2020/11/20.
//  Copyright © 2020 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TLSwipeTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

- (id)initWithEdge:(UIRectEdge)edge;

@property (readwrite, nonatomic) UIRectEdge edge;

@end

NS_ASSUME_NONNULL_END
