//
//  JSViewController.m
//  LearningCodes
//
//  Created by Tony on 2019/7/23.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "JSViewController.h"

@interface JSViewController ()

@end

@implementation JSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"GCDTest";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self JSTest];
}

- (void)JSTest {
    // 1、创建JSVirtualMachine
    JSVirtualMachine *jsvm = [[JSVirtualMachine alloc] init];
    // 2、使用jsvm的JSContext对象
    JSContext *jc = [[JSContext alloc] initWithVirtualMachine:jsvm];
    
    // 在原生代码（OC）中调用JS
    [jc evaluateScript:@"var i = 4 + 8"];
    // 将i转换为原生对象
    NSNumber *number = [jc[@"i"] toNumber];
    NSLog(@"var i is %@, number is %@", jc[@"i"], number);

    // 解析执行js脚本
    [jc evaluateScript:@"function addition(x, y) {\n    return x+y\n}\n"];
    // 获得js函数
    JSValue *addition = jc[@"addition"];
    // 传入参数
    JSValue *result = [addition callWithArguments:@[@1, @10]];
    // 将 addition 函数执行的结果转成原生 NSNumber 来使用。
    NSLog(@"function is \n%@;\n reslutValue is %@", addition, [result toNumber]);

    // JS调用原生代码
    NSLog(@"-------------------");
    jc[@"sub"] = ^(int x, int y) {
        return x - y;
    };
    JSValue *subResult = [jc evaluateScript:@"sub(4, 10)"];
    NSLog(@"sub(4, 10) is %@",[subResult toNumber]);
    
    // Test
    [jc evaluateScript:@"function Greetings() {\n    console.log(\"Hello, world!\")\n}\n"];
    JSValue *greetings = jc[@"Greetings"];
    JSValue *r = [greetings callWithArguments:@[]];
    NSLog(@"%@", result);

}



@end
