//
//  TLFullScreenSwipeAnimator.h
//  LearningCodes
//
//  Created by Tony on 2020/11/25.
//  Copyright © 2020 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    TLTransitionTypePresent,
    TLTransitionTypeDismiss,
} TLTransitionType;

@interface TLFullScreenSwipeAnimator : NSObject <UIViewControllerAnimatedTransitioning>

/*
 * 图片在屏幕中的相对位置
 */
@property (readwrite, nonatomic) CGRect imgFrameInScreen;

/*
 * 转场类型
 */
@property (assign, nonatomic) TLTransitionType type;

- (id)initWithImageFrame:(CGRect)imgFrame NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
