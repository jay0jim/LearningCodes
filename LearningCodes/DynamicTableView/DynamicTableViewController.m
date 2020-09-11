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

@property (copy, nonatomic) NSArray *urls;

@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation DynamicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.urls = @[@"https://c-ssl.duitang.com/uploads/item/201701/16/20170116105642_a3EXe.jpeg", @"https://c-ssl.duitang.com/uploads/item/201702/04/20170204154039_iYy2k.thumb.700_0.jpeg", @"https://c-ssl.duitang.com/uploads/item/201701/16/20170116105642_a3EXe.jpeg", @"https://c-ssl.duitang.com/uploads/item/201702/04/20170204154039_iYy2k.thumb.700_0.jpeg", @"https://c-ssl.duitang.com/uploads/item/201701/16/20170116105642_a3EXe.jpeg", @"https://c-ssl.duitang.com/uploads/item/201702/04/20170204154039_iYy2k.thumb.700_0.jpeg",
                       @"https://c-ssl.duitang.com/uploads/item/202005/28/20200528140705_dtsoe.jpg",
                       @"https://c-ssl.duitang.com/uploads/item/202003/09/20200309221735_ulmuj.jpg",
                       @"https://c-ssl.duitang.com/uploads/item/202003/08/20200308113806_xcdvu.jpg",
                       @"https://c-ssl.duitang.com/uploads/item/201706/28/20170628065315_sGZx4.jpeg",
                       @"https://c-ssl.duitang.com/uploads/item/201906/07/20190607102134_cwris.jpg",
                       @"https://c-ssl.duitang.com/uploads/item/201706/07/20170607124001_XsdPS.jpeg",
                       @"https://c-ssl.duitang.com/uploads/item/201712/18/20171218114506_VQiPA.jpeg",
                       @"https://c-ssl.duitang.com/uploads/item/201902/18/20190218183426_ljnhm.jpg",
                       @"https://c-ssl.duitang.com/uploads/item/202004/16/20200416165008_B3xMH.jpeg",
                       @"https://c-ssl.duitang.com/uploads/item/201706/28/20170628065738_VSGrj.jpeg",
                       @"https://c-ssl.duitang.com/uploads/blog/202009/08/20200908143624_3aea0.jpg",
                       @"https://c-ssl.duitang.com/uploads/item/202002/01/20200201151237_RVMvy.jpeg",
                       @"https://c-ssl.duitang.com/uploads/item/202006/07/20200607195916_G23zt.jpeg",
                       @"https://c-ssl.duitang.com/uploads/item/202007/26/20200726174834_LP4kN.jpeg",
                       @"https://c-ssl.duitang.com/uploads/item/202001/02/20200102134318_ogprr.jpg",
    ];
    
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
        
        for (int i = 0; i < 10; i++) {
            [self.data insertObject:@(m_count+i) atIndex:0];
        }
        m_count += 10;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
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
    
//    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:10 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    
//    NSLog(@"contentSize: %@", NSStringFromCGSize(self.tableView.contentSize));
//    NSLog(@"contentOffset: %@", NSStringFromCGPoint(self.tableView.contentOffset));
//    NSLog(@"contentInset: %@", NSStringFromUIEdgeInsets(self.tableView.contentInset));
//    NSLog(@"frame: %@", NSStringFromCGRect(self.tableView.frame));
//    NSLog(@"bound: %@", NSStringFromCGRect(self.tableView.bounds));
    
    self.tableView.contentOffset = CGPointMake(0.0f, self.tableView.contentSize.height - offsetOfButtom);
//    self.tableView.contentOffset = CGPointMake(0, 900);
    
//    CGFloat offsetOfButtom = self.tableView.contentSize.height - self.tableView.contentOffset.y;
//
//    [self.dataArray insertObjects:oldMessages atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0,[oldMessages count])]];
//
//    [self.tableView reloadData];
//
//    self.tableView.contentOffset = CGPointMake(0.0f, self.tableView.contentSize.height - offsetOfButtom - K_HeadViewHeight);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"contentSize: %@", NSStringFromCGSize(self.tableView.contentSize));
    NSLog(@"contentOffset: %@", NSStringFromCGPoint(self.tableView.contentOffset));
}


@end
