//
//  TTTextTestViewController.m
//  LearningCodes
//
//  Created by Tony on 2020/8/19.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TTTextTestViewController.h"

@interface TTTextTestViewController () <UITextViewDelegate>

@end

@implementation TTTextTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"YYText";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *str = @"奥斯卡电话费拉快递费拉寄快递吕娜V领卡萨丁奥斯卡寰谛凤翎开始了卡萨丁瞓觉了撒旦教快瞓啦sad拉克的说法解放军埃尔法接哦我阿温asdfsadfasdf柔曲蔚然";
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:str];
    
    text.yy_font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    [text yy_setTextHighlightRange:NSMakeRange(0, 4)
                             color:[UIColor colorWithRed:0.093 green:0.492 blue:1.000 alpha:1.000]
                   backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                         tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"%@", [NSString stringWithFormat:@"Tap: %@",[text.string substringWithRange:range]]);
    }];
    
    YYLabel *label = [YYLabel new];
    label.attributedText = text;
    label.frame = CGRectMake(0, 100, SCREEN_WIDTH, 500);
    label.textAlignment = NSTextAlignmentCenter;
    label.textVerticalAlignment = YYTextVerticalAlignmentTop;
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
    [self.view addSubview:label];
    
    NSString *testStr = @"#NBA季后赛#  【比赛回顾】特纳换防后单防巴特勒，不失身位送上双手大帽！随后奥拉迪波右侧@顶弧持球 迎着希罗飚中三分帮助步行者续命！#TOP10# 【点击领取你@的微博专 属球迷认证>>http://t.cn/A6U7Fj9e】http://t.cn/A6UBmvns";
    NSString *pattern = @"([hH][tT]{2}[pP]://|[hH][tT]{2}[pP][sS]://|[wW]{3}.|[wW][aA][pP].|[fF][tT][pP].|[fF][iI][lL][eE].)[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]";
    NSRegularExpression *reg = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *result = [reg matchesInString:testStr options:0 range:NSMakeRange(0, testStr.length)];
    NSLog(@"%@", result);
    
    NSString *pattern2 = @"#.+?#";
    NSRegularExpression *reg2 = [[NSRegularExpression alloc] initWithPattern:pattern2 options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *result2 = [reg2 matchesInString:testStr options:0 range:NSMakeRange(0, testStr.length)];
    NSLog(@"%@", result2);
    
    NSString *pattern3 = @"@.+?\\s";
    NSRegularExpression *reg3 = [[NSRegularExpression alloc] initWithPattern:pattern3 options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *result3 = [reg3 matchesInString:testStr options:0 range:NSMakeRange(0, testStr.length)];
    NSLog(@"%@", result3);
}


- (void)longPressTest:(UIGestureRecognizer *)gesture {
    NSLog(@"long press");
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction {
    NSLog(@"url");
    return YES;
}

@end
