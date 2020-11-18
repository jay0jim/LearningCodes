//
//  TLViewA.m
//  LearningCodes
//
//  Created by Tony on 2020/11/13.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TLViewA.h"

@implementation TLViewA

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self printResponderChain];
    [super touchesBegan:touches withEvent:event];
}

//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [touches anyObject];
//    
//    CGPoint prePoint = [touch previousLocationInView:self];
//    CGPoint curPoint = [touch locationInView:self];
//    
//    CGFloat offsetX = curPoint.x - prePoint.x;
//    CGFloat offsetY = curPoint.y - prePoint.y;
//    
//    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
//}

#pragma mark - 点击蓝色非重叠区域时，蓝色响应
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    
//    UIView *rView = [super hitTest:point withEvent:event];
//    
//    // 假定只有viewB一个subview
//    UIView *viewB = self.subviews[0];
//    CGPoint pointInViewB = [self convertPoint:point toView:viewB];
//    
//    if ([viewB pointInside:pointInViewB withEvent:event]) {
//        return viewB;
//    }
//    
//    
//    
//    return rView;
//}

#pragma mark -
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    UIView *fitView = [super hitTest:point withEvent:event];
//    
//    /******* 测试
//     
//    if (fitView == self) {
//        // 返回nil则表示ViewA不响应事件
////        return nil;
//        
//        // 把事件全部由ViewB响应（假定ViewA只有一个subview是ViewB）
//        NSArray *subviews = [self subviews];
//        return subviews[0];
//    }
//     
//     */
//    return fitView;
//}

#pragma mark - Helpers
- (void)printResponderChain
{
    UIResponder *responder = self;
    printf("%s",[NSStringFromClass([responder class]) UTF8String]);
    while (responder.nextResponder) {
        responder = responder.nextResponder;
        printf(" --> %s",[NSStringFromClass([responder class]) UTF8String]);
    }
}

@end
