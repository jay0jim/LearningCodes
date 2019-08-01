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
    
    NSMutableDictionary *aDic = [NSMutableDictionary dictionaryWithDictionary:@{@"1": @"1"}];
    
    NSDictionary *bDic = [aDic copy];
    
    NSDictionary *cDic = [aDic mutableCopy];
    
    [aDic setObject:@"2" forKey:@"2"];
    
    JMPLog(aDic[@"1"]);
    JMPLog(bDic[@"1"]);
    JMPLog(cDic[@"1"]);
    
}




@end
