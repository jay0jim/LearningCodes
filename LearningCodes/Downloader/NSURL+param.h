//
//  NSURL+param.h
//  LearningCodes
//
//  Created by Tony on 2019/11/22.
//  Copyright © 2019 Tony. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (param)

+ (NSDictionary *)paramsWithURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
