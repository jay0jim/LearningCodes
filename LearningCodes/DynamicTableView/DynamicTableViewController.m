//
//  DynamicTableViewController.m
//  LearningCodes
//
//  Created by Tony on 2020/9/10.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "DynamicTableViewController.h"

typedef enum : NSUInteger {
    DCPositionTop,
    DCPositionBottom,
} DCPosition;

#define kUpdateThresholdTop     500
#define kUpdateThresholdBottom  500

@interface DynamicTableViewController () {
    CFRunLoopObserverRef    m_observer;
}

@property (copy, nonatomic) NSArray *mockArray;
@property (strong, nonatomic) NSMutableArray *data;

// 用于记录是否“在table停止滑动后，run loop休眠前”已经进行过更新
// 当table再次滑动后将此标记重置为否
@property (assign, nonatomic) BOOL updated;
@property (assign, nonatomic) NSInteger currentTopIndex;
@property (assign, nonatomic) NSInteger currentBottomIndex;

@end

@implementation DynamicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBtn setTitle:@"点我看看" forState:UIControlStateNormal];
    [rightBtn setTintColor:[UIColor blackColor]];
    [rightBtn addTarget:self action:@selector(rightBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
//    self.tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    self.tableView.estimatedRowHeight = 0;
    
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSMutableArray *array = @[].mutableCopy;
        for (int i = 0; i < 5000; i++) {
            [array addObject:@(i)];
        }
        self.mockArray = [NSArray arrayWithArray:array];
        
        self.currentTopIndex = 2500;
        self.currentBottomIndex = 2529;
        self.data = @[].mutableCopy;
        for (int i = 0; i < 30; i++) {
            [self.data addObject:self.mockArray[i+self.currentTopIndex]];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:10 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
        });
    });
    
    // RunLoop
    CFRunLoopObserverContext context = {0,(__bridge void*)self,NULL,NULL};
    m_observer = CFRunLoopObserverCreate(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, &runLoopObserverCallback, &context);
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), m_observer, kCFRunLoopDefaultMode);
}

- (void)dealloc {
    CFRunLoopRemoveObserver(CFRunLoopGetCurrent(), m_observer, kCFRunLoopDefaultMode);
    
    NSLog(@"DynamicTableViewController dealloc...");
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    
//    NSLog(@"cellForRowAtIndexPath - %ld", indexPath.row);
    cell.textLabel.text = [NSString stringWithFormat:@"%d", [self.data[indexPath.row] intValue]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"heightForRowAtIndexPath - %ld", indexPath.row);
    return 90;
}

#pragma mark - Target actions
- (void)rightBtnPressed:(UIButton *)button {
    
//    CGFloat offsetOfButtom = self.tableView.contentSize.height - self.tableView.contentOffset.y;
//    for (int i = 0; i < 10; i++) {
//        [self.data insertObject:@(m_count+i) atIndex:0];
//    }
//    m_count += 10;
//    [self.tableView reloadData];
//
//    self.tableView.contentOffset = CGPointMake(0.0f, self.tableView.contentSize.height - offsetOfButtom);

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (self.tableView.contentOffset.y <= 200) {
//        NSLog(@"Near top");
//
//    }
//    NSLog(@"contentSize: %@", NSStringFromCGSize(self.tableView.contentSize));
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.updated = NO;
}

#pragma mark - Private methods
- (void)addCellsToPosition:(DCPosition)position {
    switch (position) {
        case DCPositionTop: {
//            NSLog(@"Add cells to top.");
            
            // 0、记录当前停止滑动时的tableView.contentOffset.y
            CGFloat offsetY = self.tableView.contentOffset.y;
            
            // 1、请求从currentTopIndex往前10位开始的10个数据，并移除data数组中最后10个元素
            // 2、将新得到的30个数据传入data数组，更新currentTopIndex、currentBottomIndex
            [self.data removeObjectsInRange:NSMakeRange(20, 10)];
            NSArray *newItems = [self.mockArray objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(self.currentTopIndex-10, 10)]];
            [self.data insertObjects:newItems atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 10)]]; // 从头插入
            self.currentTopIndex -= 10;
            self.currentBottomIndex -= 10;
            
            // 3、将tableView.contentOffset设置到停止滑动时的位置
            [self.tableView reloadData];
#warning Mock: 此处应获取前十个cell的高度然后进行累加，再加offsetY
            self.tableView.contentOffset = CGPointMake(0.0f, offsetY+900);

            break;
        }
            
        case DCPositionBottom: {
            NSLog(@"Add cells to bottom.");

            // 0、记录当前停止滑动时的tableView.contentOffset.y
            CGFloat offsetY = self.tableView.contentOffset.y;
            
            // 1、请求从currentBottomIndex往后10位的10个数据，并移除data数组中前10个元素
            // 2、将新得到的30个数据传入data数组，更新currentTopIndex
            [self.data removeObjectsInRange:NSMakeRange(0, 10)];
            NSArray *newItems = [self.mockArray objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(self.currentBottomIndex+1, 10)]];
            [self.data addObjectsFromArray:newItems]; // 从后插入
            self.currentTopIndex += 10;
            self.currentBottomIndex += 10;
            
            // 3、将tableView.contentOffset设置到停止滑动时的位置
            [self.tableView reloadData];
#warning Mock: 此处应获取前十个cell的高度然后进行累加，再减offsetY
            self.tableView.contentOffset = CGPointMake(0.0f, offsetY-900);
            
            
            break;
        }
            
        default:
            break;
    }
}

#pragma mark - RunLoop
static void runLoopObserverCallback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    DynamicTableViewController *vc = (__bridge DynamicTableViewController *)info;
    switch (activity) {
        case kCFRunLoopBeforeWaiting: {
            if (!vc.updated) {
                NSLog(@"Before Waiting");
                
                if (vc.tableView.contentOffset.y < kUpdateThresholdTop) {
                    [vc addCellsToPosition:DCPositionTop];
                }
                
                CGFloat height = vc.tableView.contentSize.height;
                CGFloat offsetToBottom = vc.tableView.contentOffset.y + vc.tableView.bounds.size.height;
                if (height - offsetToBottom < kUpdateThresholdBottom) {
                    [vc addCellsToPosition:DCPositionBottom];
                }
                
                vc.updated = YES;
            }
            break;
        }
            
        default:
            break;
    }
    
}


@end
