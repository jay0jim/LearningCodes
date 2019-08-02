//
//  BasicTestViewController.m
//  LearningCodes
//
//  Created by Tony on 2019/8/1.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "BasicTestViewController.h"

@interface BasicTestViewController ()

@property (strong, nonatomic) NSMutableDictionary *dicForMutableTest;

@end

@implementation BasicTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"GCDTest";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self mutableTest];
}

- (void)mutableTest {
//    NSMutableDictionary *aDic = [[NSMutableDictionary alloc] initWithCapacity:10];
//
//    self.dicForMutableTest = aDic;
//
//    NSDictionary *bDic = aDic;
//    [aDic setObject:@"1" forKey:@"1"];
//
//    NSLog(@"a:%@, b:%@, self.dic:%@", aDic, bDic, self.dicForMutableTest);
    
//    self.dicForMutableTest = [[NSMutableDictionary alloc] initWithCapacity:10];
//
//    NSLog(@"%@", [self.dicForMutableTest class]);
    
//    [self.dicForMutableTest setObject:@"1" forKey:@"1"];
//
//    NSLog(@"%@", self.dicForMutableTest);
    
//    NSMutableDictionary *aDic = [NSMutableDictionary dictionaryWithDictionary:@{@"1": @"1"}];
//
//    NSDictionary *bDic = [aDic copy];
//
//    NSDictionary *cDic = [aDic mutableCopy];
//
//    [aDic setObject:@"2" forKey:@"2"];
//
//    JMPLog(aDic[@"1"]);
//    JMPLog(bDic[@"1"]);
//    JMPLog(cDic[@"1"]);
    
    // 基本数据类型
//    int a = 0;
//    int b = a;
//
//    JMPLog(&a);
//    JMPLog(&b);
    
//    // 不可变非集合类型对象
//    NSString *strA = @"strA";
//    NSString *strB = [strA copy];
//    NSString *strC = [strA mutableCopy];
//    NSLog(@"Value -- strA: %@, strB: %@, strC: %@", strA, strB, strC);
//    NSLog(@"Pointer -- strA: %p, strB: %p, strC: %p", &strA, &strB, &strC);
//    NSLog(@"Pointer of value -- strA: %p, strB: %p, strC: %p", strA, strB, strC);
    
//    // 可变非集合类型对象
//    NSMutableString *strA = [NSMutableString stringWithFormat:@"strA"];
//    NSString *copyStr = [strA copy];
//    NSString *copyStr2 = [strA copy];
//    NSMutableString *copyMStr = [strA copy];
//    NSMutableString *copyMStr2 = [strA copy];
//    NSString *mutableCopyStr = [strA mutableCopy];
//    NSString *mutableCopyStr2 = [strA mutableCopy];
//    NSMutableString *mutableCopyMStr = [strA mutableCopy];
//    NSMutableString *mutableCopyMStr2 = [strA mutableCopy];
//
//    NSLog(@"strA -- %p &strA -- %p", strA, &strA);
//    NSLog(@"copyStr -- %p &copyStr -- %p", copyStr, &copyStr);
//    NSLog(@"copyStr2 -- %p &copyStr2 -- %p", copyStr2, &copyStr2);
//    NSLog(@"copyMStr -- %p &copyMStr -- %p", copyMStr, &copyMStr);
//    NSLog(@"copyMStr2 -- %p &copyMStr2 -- %p", copyMStr2, &copyMStr2);
//    NSLog(@"mutableCopyStr -- %p &mutableCopyStr -- %p", mutableCopyStr, &mutableCopyStr);
//    NSLog(@"mutableCopyStr2 -- %p &mutableCopyStr2 -- %p", mutableCopyStr2, &mutableCopyStr2);
//    NSLog(@"mutableCopyMStr -- %p &mutableCopyMStr -- %p", mutableCopyMStr, &mutableCopyMStr);
//    NSLog(@"mutableCopyMStr2 -- %p &mutableCopyMStr2 -- %p", mutableCopyMStr2, &mutableCopyMStr2);
    
    // 不可变集合类型对象
//    NSDictionary *aDic = @{@"aaa": @"111"};
//
//    NSDictionary *copyDic = [aDic copy];
//    NSDictionary *copyDic2 = [aDic copy];
//    NSMutableDictionary *copyMDic = [aDic copy];
//    NSMutableDictionary *copyMDic2 = [aDic copy];
//
//    NSDictionary *mutableCopyDic = [aDic mutableCopy];
//    NSDictionary *mutableCopyDic2 = [aDic mutableCopy];
//    NSMutableDictionary *mutableCopyMDic = [aDic mutableCopy];
//    NSMutableDictionary *mutableCopyMDic2 = [aDic mutableCopy];
//
//    NSLog(@"aDic -- %p aDic[@\"aaa\"] -- %p key aaa -- %p", aDic, aDic[@"aaa"], [[aDic allKeys] firstObject]);
//
//    NSLog(@"copyDic -- %p copyDic[@\"aaa\"] -- %p key aaa -- %p", copyDic, copyDic[@"aaa"], [[copyDic allKeys] firstObject]);
//    NSLog(@"copyDic2 -- %p copyDic2[@\"aaa\"] -- %p key aaa -- %p", copyDic2, copyDic2[@"aaa"], [[copyDic2 allKeys] firstObject]);
//    NSLog(@"copyMDic -- %p copyMDic[@\"aaa\"] -- %p key aaa -- %p", copyMDic, copyMDic[@"aaa"], [[copyMDic allKeys] firstObject]);
//    NSLog(@"copyMDic2 -- %p copyMDic2[@\"aaa\"] -- %p key aaa -- %p", copyMDic2, copyMDic2[@"aaa"], [[copyMDic2 allKeys] firstObject]);
//
//    NSLog(@"mutableCopyDic -- %p mutableCopyDic[@\"aaa\"] -- %p key aaa -- %p", mutableCopyDic, mutableCopyDic[@"aaa"], [[mutableCopyDic allKeys] firstObject]);
//    NSLog(@"mutableCopyDic2 -- %p mutableCopyDic2[@\"aaa\"] -- %p key aaa -- %p", mutableCopyDic2, mutableCopyDic2[@"aaa"], [[mutableCopyDic2 allKeys] firstObject]);
//    NSLog(@"mutableCopyMDic -- %p mutableCopyMDic[@\"aaa\"] -- %p key aaa -- %p", mutableCopyMDic, mutableCopyMDic[@"aaa"], [[mutableCopyMDic allKeys] firstObject]);
//    NSLog(@"mutableCopyMDic2 -- %p mutableCopyMDic2[@\"aaa\"] -- %p key aaa -- %p", mutableCopyMDic2, mutableCopyMDic2[@"aaa"], [[mutableCopyMDic2 allKeys] firstObject]);
    
    // 可变集合类型对象
    NSMutableDictionary *aDic = [NSMutableDictionary dictionaryWithCapacity:10];
    [aDic setObject:@"111" forKey:@"aaa"];
    
    NSDictionary *copyDic = [aDic copy];
    NSDictionary *copyDic2 = [aDic copy];
    NSMutableDictionary *copyMDic = [aDic copy];
    NSMutableDictionary *copyMDic2 = [aDic copy];
    
    NSDictionary *mutableCopyDic = [aDic mutableCopy];
    NSDictionary *mutableCopyDic2 = [aDic mutableCopy];
    NSMutableDictionary *mutableCopyMDic = [aDic mutableCopy];
    NSMutableDictionary *mutableCopyMDic2 = [aDic mutableCopy];
    
    NSLog(@"aDic -- %p aDic[@\"aaa\"] -- %p key aaa -- %p", aDic, aDic[@"aaa"], [[aDic allKeys] firstObject]);
    
    NSLog(@"copyDic -- %p copyDic[@\"aaa\"] -- %p key aaa -- %p", copyDic, copyDic[@"aaa"], [[copyDic allKeys] firstObject]);
    NSLog(@"copyDic2 -- %p copyDic2[@\"aaa\"] -- %p key aaa -- %p", copyDic2, copyDic2[@"aaa"], [[copyDic2 allKeys] firstObject]);
    NSLog(@"copyMDic -- %p copyMDic[@\"aaa\"] -- %p key aaa -- %p", copyMDic, copyMDic[@"aaa"], [[copyMDic allKeys] firstObject]);
    NSLog(@"copyMDic2 -- %p copyMDic2[@\"aaa\"] -- %p key aaa -- %p", copyMDic2, copyMDic2[@"aaa"], [[copyMDic2 allKeys] firstObject]);
    
    NSLog(@"mutableCopyDic -- %p mutableCopyDic[@\"aaa\"] -- %p key aaa -- %p", mutableCopyDic, mutableCopyDic[@"aaa"], [[mutableCopyDic allKeys] firstObject]);
    NSLog(@"mutableCopyDic2 -- %p mutableCopyDic2[@\"aaa\"] -- %p key aaa -- %p", mutableCopyDic2, mutableCopyDic2[@"aaa"], [[mutableCopyDic2 allKeys] firstObject]);
    NSLog(@"mutableCopyMDic -- %p mutableCopyMDic[@\"aaa\"] -- %p key aaa -- %p", mutableCopyMDic, mutableCopyMDic[@"aaa"], [[mutableCopyMDic allKeys] firstObject]);
    NSLog(@"mutableCopyMDic2 -- %p mutableCopyMDic2[@\"aaa\"] -- %p key aaa -- %p", mutableCopyMDic2, mutableCopyMDic2[@"aaa"], [[mutableCopyMDic2 allKeys] firstObject]);
    

    
}




@end
