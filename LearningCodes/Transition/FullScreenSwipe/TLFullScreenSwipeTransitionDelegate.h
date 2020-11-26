//
//  TLFullScreenSwipeTransitionDelegate.h
//  LearningCodes
//
//  Created by Tony on 2020/11/26.
//  Copyright © 2020 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TLFullScreenSwipeTransitionDelegate : NSObject <UIViewControllerTransitioningDelegate>

/*
 * 图片在屏幕中的相对位置
 */
@property (readwrite, nonatomic) CGRect imgFrameInScreen;

@end

NS_ASSUME_NONNULL_END
