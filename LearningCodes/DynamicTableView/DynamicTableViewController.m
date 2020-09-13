//
//  DynamicTableViewController.m
//  LearningCodes
//
//  Created by Tony on 2020/9/10.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "DynamicTableViewController.h"



@interface DynamicTableViewController () {
    int     m_count;
}

@property (strong, nonatomic) NSMutableArray *data;

// 用于记录是否“在table停止滑动后，run loop休眠前”已经进行过更新
// 当table再次滑动后将此标记重置为否
@property (assign, nonatomic) BOOL updated;

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
        self.data = @[].mutableCopy;
        m_count = 0;
        
        for (int i = 0; i < 30; i++) {
            [self.data insertObject:@(m_count+i) atIndex:0];
        }
        m_count += 30;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:10 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
        });
    });
    
    // RunLoop
    CFRunLoopObserverContext context = {0,(__bridge void*)self,NULL,NULL};
    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, &runLoopObserverCallback, &context);
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
}

- (void)dealloc {
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
    NSLog(@"heightForRowAtIndexPath - %ld", indexPath.row);
    return 90;
}

#pragma mark - Target actions
- (void)rightBtnPressed:(UIButton *)button {
    
    CGFloat offsetOfButtom = self.tableView.contentSize.height - self.tableView.contentOffset.y;
    for (int i = 0; i < 10; i++) {
        [self.data insertObject:@(m_count+i) atIndex:0];
    }
    m_count += 10;
    [self.tableView reloadData];
    
    self.tableView.contentOffset = CGPointMake(0.0f, self.tableView.contentSize.height - offsetOfButtom);

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (self.tableView.contentOffset.y <= 200) {
//        NSLog(@"Near top");
//
//    }
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.updated = NO;
}

#pragma mark - Private methods
- (void)addCellsToPosition {
    
}

#pragma mark - RunLoop
static void runLoopObserverCallback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    DynamicTableViewController *vc = (__bridge DynamicTableViewController *)info;
    switch (activity) {
        case kCFRunLoopBeforeWaiting: {
            if (!vc.updated) {
                NSLog(@"Before Waiting");
                
                
                
                vc.updated = YES;
            }
            break;
        }
            
        default:
            break;
    }
    
}


@end
