//
//  DynamicCellHeightViewController.m
//  LearningCodes
//
//  Created by Tony Lee on 2020/8/30.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "DynamicCellHeightViewController.h"
#import "DynamicCellHeightTableViewCell.h"

typedef void(^CellOperationBlock)(void);

@interface DynamicCellHeightViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *heights;
@property (strong, nonatomic) NSMutableArray *optBlocks;

@end

@implementation DynamicCellHeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 64;
    
    self.heights = @{}.mutableCopy;
    self.optBlocks = @[].mutableCopy;
    
    //
    [self runLoopOptimization];
}

- (void)dealloc {
    NSLog(@"DynamicCellHeightViewController dealloc...");
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DynamicCellHeightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"DynamicCellHeightTableViewCell" owner:self options:nil].firstObject;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    cell.callback = ^{
        NSLog(@"%ld", indexPath.row);
        CellOperationBlock block = ^{
            [self setCellImageWithIndexPath:indexPath];
        };
        [self.optBlocks jk_addObj:block];
    };
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = [NSString stringWithFormat:@"%ld", indexPath.row];
    CGFloat height = [self.heights jk_floatForKey:key];
    if (height <= 0.001) {
        // 默认高度
        height = 150;
    }
    return height;
}

- (void)setCellImageWithIndexPath:(NSIndexPath *)indexPath {
//    DynamicCellHeightTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"hhh...");
    
    NSString *key = [NSString stringWithFormat:@"%ld", indexPath.row];
    [self.heights jk_setCGFloat:200.0 forKey:key];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    });
    
}

#pragma mark - RunLoop
- (void)runLoopOptimization {
    //1、先获取当前的Runloop
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    //定义观察者
    CFRunLoopObserverRef observer;
    CFRunLoopObserverContext context = {
        0,
        (__bridge void *)self,
        &CFRetain,
        &CFRelease,
        NULL
    };
    /*创建观察者
     参数一：分配空间的方式，
     参数二：运行循环状态，
     参数三：是否一直监听，
     参数四：优先级
     参数五：回调函数的地址，
     参数六：上下文
     */
    observer = CFRunLoopObserverCreate(kCFAllocatorMalloc,
                                       kCFRunLoopBeforeWaiting,
                                       YES,
                                       0,
                                       &Callback,
                                       &context);
    //添加观察者，添加在common模式下面
    CFRunLoopAddObserver(runloop, observer, kCFRunLoopCommonModes);

    
    
    //创建定时器 (保证runloop回调函数一直在执行)
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(notDoSomething)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)notDoSomething {
    // 不做事情,就是为了让 callBack() 函数一直相应
}

//定义一个回调函数  一次RunLoop来一次
static void Callback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    DynamicCellHeightViewController * vcSelf = (__bridge DynamicCellHeightViewController *)(info);
    
    if (vcSelf.optBlocks.count > 0) {
        //获取一次数组里面的任务并执行
        CellOperationBlock block = vcSelf.optBlocks.firstObject;
        if (block) {
            block();
        }
        [vcSelf.optBlocks removeObjectAtIndex:0];
    }
    
}

@end
