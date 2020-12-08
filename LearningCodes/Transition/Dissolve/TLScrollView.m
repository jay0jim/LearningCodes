//
//  TLScrollView.m
//  LearningCodes
//
//  Created by Tony on 2020/11/11.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TLScrollView.h"

@interface TLScrollView () <UIGestureRecognizerDelegate> {
    CFRunLoopObserverRef    m_observer;
}

@property (assign, nonatomic) BOOL canUpdate;

@end

@implementation TLScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupRunLoop];
        
        self.delegate = self;
        _canUpdate = NO;
    }
    return self;
}

- (void)setupRunLoop {
    CFRunLoopObserverContext context = {0, (__bridge void *)self, NULL, NULL};
    m_observer = CFRunLoopObserverCreate(CFAllocatorGetDefault(),
                                         kCFRunLoopAllActivities,
                                         YES,
                                         0,
                                         &runLoopObserverCallback,
                                         &context);
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), m_observer, kCFRunLoopDefaultMode);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    // 首先判断otherGestureRecognizer是不是系统pop手势
    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UILayoutContainerView")]) {
        // 再判断系统手势的state是began还是fail，同时判断scrollView的位置是不是正好在最左边
        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.contentOffset.x == 0) {
            return YES;
        }
    }
    
    // 判断是否为panGesture
    if ([otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        if ((otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.contentOffset.y <= 0)) {
            return YES;
        }
    }
    
    return NO;
}

#pragma mark - Scroll View
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    NSLog(@"begin dragging");
    scrollView.bounces = (scrollView.contentOffset.y <= 0)? NO : YES;
    self.canUpdate = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

#pragma mark - RunLoop
static void runLoopObserverCallback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    TLScrollView *scrollView = (__bridge TLScrollView *)info;
    switch (activity) {
        case kCFRunLoopBeforeWaiting: {
            if (scrollView.canUpdate) {
//                NSLog(@"RunLoop before waiting");
                
                
                scrollView.canUpdate = NO;
            }
            break;
        }
            
        default:
            break;
    }
}

@end
