//
//  NSURL+param.m
//  LearningCodes
//
//  Created by Tony on 2019/11/22.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "NSURL+param.h"

//#import <AppKit/AppKit.h>


@implementation NSURL (param)

+ (NSDictionary *)paramsWithURL:(NSURL *)url {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:10];
    
    NSString *urlStr = [url absoluteString];
    if (urlStr.length <= 0) {
        return nil;
    }
    
    // 先分离'?'
    NSArray *elements = [urlStr componentsSeparatedByString:@"?"];
    [dic setObject:elements[0] forKey:elements[0]];
    NSString *paramStr = elements[1];
    
    // 分离'&'
    NSArray *params = [paramStr componentsSeparatedByString:@"&"];
    for (NSString *param in params) {
        NSRange range = [param rangeOfString:@"="];
        NSString *key = [param substringToIndex:range.location];
        NSString *value = [param substringFromIndex:range.location+1];
        [dic setObject:value forKey:key];
    }
    
    return dic;
}

@end
