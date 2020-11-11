//
//  AppDelegate.m
//  LearningCodes
//
//  Created by Tony on 2019/6/28.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong, nonatomic) dispatch_source_t timer;
@property (strong, nonatomic) dispatch_source_t warningTimer;
@property (assign, nonatomic) UIBackgroundTaskIdentifier backgroundTask;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    
    MainTableViewController *tableVC = [[MainTableViewController alloc] initWithStyle:UITableViewStylePlain];
    JMNavigationController *nav = [[JMNavigationController alloc] initWithRootViewController:tableVC];
    
    self.window.rootViewController = nav;
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

#pragma mark - Background
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // 后台计时测试
//    [self beginBackgroundTask];
    
}

- (void)beginBackgroundTask {
    // 申请更长的后台时间
    self.backgroundTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundTask];
        self.backgroundTask = UIBackgroundTaskInvalid;
    }];
    
    if (self.backgroundTask == UIBackgroundTaskInvalid) {
        NSLog(@"申请后台时间失败！");
        return ;
    }
    
    NSLog(@"%@", [NSDate date]);
    
    //获取沙盒路径
    NSArray *paths  = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    //获取文件路径
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"testLogs.txt"];
    NSLog(@"%@", filePath);
    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager fileExistsAtPath:filePath];
    if(![fileManager fileExistsAtPath:filePath]){
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *datestr = [dateFormatter stringFromDate:[NSDate date]];
        NSString *str = [NSString stringWithFormat:@"%@ - 日志开始记录\n", datestr];
        NSLog(@"%@", str);
        [str writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
    __block NSInteger i = 0;
    dispatch_source_set_event_handler(self.timer, ^{
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *datestr = [dateFormatter stringFromDate:[NSDate date]];
        NSString *str = [NSString stringWithFormat:@"%@ - %ld\n", datestr, i];
        NSLog(@"%ld", i);
        i++;
        [fileHandle seekToEndOfFile];
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        [fileHandle writeData:data];
        [fileHandle closeFile];
    });
    dispatch_resume(self.timer);
    
    dispatch_queue_t queue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.warningTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue2);
    dispatch_source_set_timer(self.warningTimer, dispatch_walltime(NULL, 150 * NSEC_PER_SEC), 10 * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.warningTimer, ^{
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *datestr = [dateFormatter stringFromDate:[NSDate date]];
        NSString *str = [NSString stringWithFormat:@"%@ - 倒计时警告\n", datestr];
        NSLog(@"%@", str);
        NSLog(@"%@",[NSThread callStackSymbols]);
        dispatch_source_cancel(self.warningTimer);
        self.warningTimer = nil;
    });
    dispatch_resume(self.warningTimer);
}

- (void)endBackgroundTask {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *datestr = [dateFormatter stringFromDate:[NSDate date]];
    NSString *str = [NSString stringWithFormat:@"%@ - 结束\n", datestr];
    NSLog(@"%@", str);
    [[UIApplication sharedApplication] endBackgroundTask:self.backgroundTask];
    self.backgroundTask = UIBackgroundTaskInvalid;
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
