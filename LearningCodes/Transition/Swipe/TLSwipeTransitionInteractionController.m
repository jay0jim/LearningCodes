//
//  TLSwipeTransitionInteractionController.m
//  LearningCodes
//
//  Created by Tony on 2020/11/20.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TLSwipeTransitionInteractionController.h"

@interface TLSwipeTransitionInteractionController ()

@property (weak, nonatomic) id<UIViewControllerContextTransitioning> transitionContext;

@property (strong, nonatomic, readonly) UIScreenEdgePanGestureRecognizer *edgeRecognizer;
@property (nonatomic, readonly) UIRectEdge edge;

@end

@implementation TLSwipeTransitionInteractionController

- (id)initWithGestureRecognizer:(UIScreenEdgePanGestureRecognizer *)edgeRecognize edge:(UIRectEdge)edge {
    if (self = [super init]) {
        _edgeRecognizer = edgeRecognize;
        _edge = edge;
        
        [_edgeRecognizer addTarget:self action:@selector(gestureRecognizeDidUpdate:)];
    }
    return self;
}

- (void)dealloc {
    [_edgeRecognizer removeTarget:self action:@selector(gestureRecognizeDidUpdate:)];
}

- (void)gestureRecognizeDidUpdate:(UIScreenEdgePanGestureRecognizer *)edgeRecognizer {
    switch (edgeRecognizer.state) {
        case UIGestureRecognizerStateBegan: {
            
            break;
        }
            
        case UIGestureRecognizerStateChanged: {
            // 开始拖动，更新手势对应的百分比
            [self updateInteractiveTransition:[self percentForGesture:edgeRecognizer]];
            break;
        }
            
        case UIGestureRecognizerStateEnded: {
            // 停止拖动，决定是完成还是取消，取决于拖动的百分比
            // 如果比例超过一半，则认为是完成，补全余下动作
            // 如果比例不足一半，则认为是取消，回到原来的情况
            if ([self percentForGesture:edgeRecognizer] >= 0.5) {
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

#pragma mark - UIPercentDrivenInteractiveTransition Methods
- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    self.transitionContext = transitionContext;
    
    [super startInteractiveTransition:transitionContext];
    
}

- (CGFloat)percentForGesture:(UIScreenEdgePanGestureRecognizer *)gesture {
    UIView *transitionContainerView = self.transitionContext.containerView;
    
    CGPoint locationInSourceView = [gesture locationInView:transitionContainerView];
    
    CGFloat width = CGRectGetWidth(transitionContainerView.bounds);
    CGFloat height = CGRectGetHeight(transitionContainerView.bounds);
    
    CGFloat percent;
    switch (self.edge) {
        case UIRectEdgeTop: {
            percent = locationInSourceView.y / height;
            break;
        }
            
        case UIRectEdgeBottom: {
            percent = (height - locationInSourceView.y) / height;
            break;;
        }
            
        case UIRectEdgeLeft: {
            percent = locationInSourceView.x / width;
            break;
        }
            
        case UIRectEdgeRight: {
            percent = (width - locationInSourceView.x) / width;
            break;
        }
            
        default: {
            percent = 0.;
            break;
        }
    }
    
    return percent;
}

@end
