//
//  TLSwipeDownTransitionInteractionController.m
//  LearningCodes
//
//  Created by Tony on 2020/12/2.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TLSwipeDownTransitionInteractionController.h"

@interface TLSwipeDownTransitionInteractionController ()

@property (strong, nonatomic) UIPanGestureRecognizer *gesture;

@property (strong, nonatomic) id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation TLSwipeDownTransitionInteractionController

#pragma mark - Life Cycle
- (id)initWithPanGesture:(UIPanGestureRecognizer *)gesture {
    if (self = [super init]) {
        _gesture = gesture;
        
        [_gesture addTarget:self action:@selector(gestureRecognizerDidUpdate:)];
    }
    return self;
}

- (void)dealloc {
    [_gesture removeTarget:self action:@selector(gestureRecognizerDidUpdate:)];
}

#pragma mark - Target actions
- (void)gestureRecognizerDidUpdate:(UIPanGestureRecognizer *)gesture {
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            break;
            
        case UIGestureRecognizerStateChanged: {
            [self updateInteractiveTransition:[self percentForGesture:gesture]];
            break;
        }
            
        case UIGestureRecognizerStateEnded: {
            // 停止拖动，决定是完成还是取消，取决于拖动的百分比
            // 如果比例超过一半，则认为是完成，补全余下动作
            // 如果比例不足一半，则认为是取消，回到原来的情况
            if ([self percentForGesture:gesture] >= 0.5) {
                [self finishInteractiveTransition];
            } else {
                [self cancelInteractiveTransition];
            }
            break;
        }
            
        default:
            [self cancelInteractiveTransition];
            break;
    }
}

#pragma mark - Private Methods
- (CGFloat)percentForGesture:(UIPanGestureRecognizer *)gesture {
    return 0.;
}

#pragma mark - UIPercentDrivenInteractiveTransition Methods
- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    self.transitionContext = transitionContext;
    
    [super startInteractiveTransition:transitionContext];
}

@end
