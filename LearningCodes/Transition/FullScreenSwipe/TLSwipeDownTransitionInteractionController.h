//
//  TLSwipeDownTransitionInteractionController.h
//  LearningCodes
//
//  Created by Tony on 2020/12/2.
//  Copyright © 2020 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TLSwipeDownTransitionInteractionController : UIPercentDrivenInteractiveTransition

- (instancetype)init NS_UNAVAILABLE;

- (id)initWithPanGesture:(UIPanGestureRecognizer *)gesture NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
