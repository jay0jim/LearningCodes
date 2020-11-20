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
    }
    return self;
}

@end
