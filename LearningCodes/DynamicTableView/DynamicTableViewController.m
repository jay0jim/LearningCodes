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

#define kMockCount              100

@interface DynamicTableViewController () {
    CFRunLoopObserverRef    m_observer;
}

@property (copy, nonatomic) NSArray *mockArray;
@property (copy, nonatomic) NSDictionary *mockHeightDic;

@property (strong, nonatomic) NSMutableArray *data;
@property (strong, nonatomic) NSMutableDictionary *heights;

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
    // 屏蔽点击statusBar回到最顶
    self.tableView.scrollsToTop = NO;
    
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSMutableArray *array = @[].mutableCopy;
        NSMutableDictionary *dic = @{}.mutableCopy;
        for (int i = 0; i < kMockCount; i++) {
            [array addObject:@(i)];
            
            int a = arc4random()%20;
            a *= 10;
            a += 100;
            [dic setObject:@(a) forKey:[NSString stringWithFormat:@"%d", i]];
        }
        self.mockArray = [NSArray arrayWithArray:array];
        self.mockHeightDic = [NSDictionary dictionaryWithDictionary:dic];
        
        self.currentTopIndex = 0;
        self.currentBottomIndex = self.currentTopIndex + 29;
        self.data = @[].mutableCopy;
        self.heights = @{}.mutableCopy;
        for (int i = 0; i < 30; i++) {
            [self.data addObject:self.mockArray[i+self.currentTopIndex]];
            
            NSNumber *h = [self.mockHeightDic objectForKey:[NSString stringWithFormat:@"%ld", i+self.currentTopIndex]];
            [self.heights setObject:h forKey:[NSString stringWithFormat:@"%d", i]];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
//            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:10 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
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
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = [NSString stringWithFormat:@"IndexPath.row: %d\nCell height: %.2f", [self.data[indexPath.row] intValue], cell.bounds.size.height];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"heightForRowAtIndexPath - %ld", indexPath.row);
    NSNumber *h = [self.heights objectForKey:[NSString stringWithFormat:@"%ld", indexPath.row]];
    if (h) {
        CGFloat height = [h doubleValue];
        return height;
    }
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
            
            // 1、请求从currentTopIndex往前10位开始的10个数据，并移除data数组中最后对应数量个元素
            // 2、将新得到的30个数据传入data数组，更新currentTopIndex、currentBottomIndex
            NSArray *newItems = [self requestDataWithLocation:self.currentTopIndex-10 Length:10];
            [self.data removeObjectsInRange:NSMakeRange(20, newItems.count)];
            [self.data insertObjects:newItems atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, newItems.count)]]; // 从头插入
            self.currentTopIndex = (self.currentTopIndex - newItems.count);
            self.currentBottomIndex = (self.currentBottomIndex - newItems.count);
            
            // 更新高度
            CGFloat heightForTopCells = 0.;
            [self.heights removeAllObjects];
            for (int i = 0; i < self.currentBottomIndex - self.currentTopIndex + 1; i++) {
                NSNumber *h = [self.mockHeightDic objectForKey:[NSString stringWithFormat:@"%ld", i+self.currentTopIndex]];
                [self.heights setObject:h forKey:[NSString stringWithFormat:@"%d", i]];
                if (i < newItems.count) {
                    heightForTopCells += [h doubleValue];
                }
            }
            
            
            // 3、将tableView.contentOffset设置到停止滑动时的位置
            [self.tableView reloadData];
            self.tableView.contentOffset = CGPointMake(0.0f, offsetY+heightForTopCells);

            break;
        }
            
        case DCPositionBottom: {
//            NSLog(@"Add cells to bottom.");

            // 0、记录当前停止滑动时的tableView.contentOffset.y与底部之间的距离
            CGFloat offsetYToBottom = self.tableView.contentSize.height - self.tableView.contentOffset.y;
            
            // 1、请求从currentBottomIndex往后10位的10个数据，并移除data数组中前面对应数量个元素
            // 2、将新得到的30个数据传入data数组，更新currentTopIndex
            NSArray *newItems = [self requestDataWithLocation:self.currentBottomIndex+1 Length:10];
            [self.data removeObjectsInRange:NSMakeRange(0, newItems.count)];
            [self.data addObjectsFromArray:newItems]; // 从后插入
            self.currentTopIndex = (self.currentTopIndex + newItems.count);
            self.currentBottomIndex = (self.currentBottomIndex + newItems.count);
            
            // 更新高度
            CGFloat heightForTopCells = 0.;
            [self.heights removeAllObjects];
            for (int i = 0; i < self.currentBottomIndex - self.currentTopIndex + 1; i++) {
                NSNumber *h = [self.mockHeightDic objectForKey:[NSString stringWithFormat:@"%ld", i+self.currentTopIndex]];
                [self.heights setObject:h forKey:[NSString stringWithFormat:@"%d", i]];
                if (i > self.data.count - newItems.count - 1) {
                    heightForTopCells += [h doubleValue];
                }
            }
            
            // 3、将tableView.contentOffset设置到停止滑动时的位置
            [self.tableView reloadData];
            // 用tableView新的高度减去offsetYToBottom与新加入的cells的高度之和即为现在的offset.y
            self.tableView.contentOffset = CGPointMake(0.0f, self.tableView.contentSize.height - (offsetYToBottom+heightForTopCells));
            
            
            break;
        }
            
        default:
            break;
    }
}

- (NSArray *)requestDataWithLocation:(NSInteger)loc Length:(NSInteger)len {
    if (len < 0) {
        NSLog(@"len: %ld\nLength error! Please check!",len);
        return nil;
    }
    
    NSInteger newLen = len;
    if (loc < 0) {
        newLen = loc + len;
        loc = 0;
    }
    
    if (loc+len > kMockCount-1) {
        newLen = kMockCount - loc;
    }
    
    NSArray *newItems = [self.mockArray objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(loc, newLen)]];
    
    return newItems;
}

#pragma mark - RunLoop
static void runLoopObserverCallback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    DynamicTableViewController *vc = (__bridge DynamicTableViewController *)info;
    switch (activity) {
        case kCFRunLoopBeforeWaiting: {
            if (!vc.updated) {
//                NSLog(@"Before Waiting");
                
                if (vc.tableView.contentOffset.y < kUpdateThresholdTop && vc.currentTopIndex > 0) {
                    [vc addCellsToPosition:DCPositionTop];
                }

                CGFloat height = vc.tableView.contentSize.height;
                CGFloat offsetToBottom = vc.tableView.contentOffset.y + vc.tableView.bounds.size.height;
                if (height - offsetToBottom < kUpdateThresholdBottom && vc.currentBottomIndex < kMockCount-1) {
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
