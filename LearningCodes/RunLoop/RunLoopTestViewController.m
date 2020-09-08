//
//  RunLoopTestViewController.m
//  LearningCodes
//
//  Created by Tony on 2019/7/12.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "RunLoopTestViewController.h"
#import "JMLagMonitor.h"

@interface RunLoopTestViewController () <UITableViewDelegate, UITableViewDataSource> {
    CFRunLoopObserverRef m_observer;
}

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation RunLoopTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RunLoopTest";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"timer...");
//    }];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
//    [self createObserver];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 100, 200) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
//    JMLagMonitor *monitor = [JMLagMonitor sharedInstance];
//    [monitor beginMonitor];
    
    
    
    
}

- (void)dealloc {
//    [self.timer invalidate];
    NSLog(@"dealloc..");
//    [[JMLagMonitor sharedInstance] endMonitor];
    
//    CFRunLoopRemoveObserver(CFRunLoopGetCurrent(), m_observer, kCFRunLoopDefaultMode);
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", indexPath.row);
    return 44;
}

#pragma mark - Events
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [NSThread detachNewThreadSelector:@selector(task) toTarget:self withObject:nil];
}

- (void)task {
    NSLog(@"%s", __func__);
}

- (void)createObserver {
    m_observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"即将进入runloop");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"即将处理timer事件");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"即将处理source事件");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"即将进入睡眠");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"被唤醒");
                break;
            case kCFRunLoopExit:
                NSLog(@"runloop退出");
                break;
                
            default:
                break;
        }
    });
    
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), m_observer, kCFRunLoopDefaultMode);
}

@end
