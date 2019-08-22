//
//  AddingCellTestViewController.m
//  LearningCodes
//
//  Created by Tony on 2019/8/4.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "AddingCellTestViewController.h"

static NSInteger count = 10;

@interface AddingCellTestViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (copy, nonatomic) NSArray *allDataArray;
@property (copy, nonatomic) NSArray *heightArray;
@property (strong, nonatomic) NSMutableSet *loadedIndex;
@property (assign, nonatomic) NSInteger loadIndex;

@property (strong, nonatomic) UITableView *tableView;
@property (assign, nonatomic) BOOL firstLoad;
@property (assign, nonatomic) CGFloat tableHeight;

@property (strong, nonatomic) UIButton *addTopButton;
@property (strong, nonatomic) UIButton *addBottomButton;

@end

@implementation AddingCellTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Adding Cells";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self mockingData];

    [self initUI];
    
}

- (void)initUI {
    self.firstLoad = YES;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 88;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
    [self.view addSubview:self.tableView];
    
    self.addTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addTopButton setTitle:@"从上添加" forState:UIControlStateNormal];
    [self.addTopButton setBackgroundColor:[UIColor greenColor]];
    [self.addTopButton addTarget:self action:@selector(addCellsAtTop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addTopButton];
    [self.addTopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).with.offset(50);
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(-80);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    
    self.addBottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addBottomButton setTitle:@"从下添加" forState:UIControlStateNormal];
    [self.addBottomButton setBackgroundColor:[UIColor blueColor]];
    [self.addBottomButton addTarget:self action:@selector(addCellsAtBottom) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addBottomButton];
    [self.addBottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right).with.offset(-50);
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(-80);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
}

- (void)mockingData {
    NSMutableArray *mockArray = [NSMutableArray arrayWithCapacity:200];
    for (int i = 0; i < 200; i++) {
        [mockArray addObject:[NSString stringWithFormat:@"%d", i]];
    }
    self.allDataArray = mockArray;
    
    [mockArray removeAllObjects];
    for (int i = 0; i < 200; i++) {
        float h = 88 * ((i)%3 + 1);
        [mockArray addObject:@(h)];
//        [mockArray addObject:[NSString stringWithFormat:@"%f", h]];
    }
    self.heightArray = mockArray;
    
    self.loadIndex = 100;
    NSArray *subArray = [self.allDataArray subarrayWithRange:NSMakeRange(self.loadIndex, 20)];
    self.dataArray = [NSMutableArray arrayWithArray:subArray];
    
    self.loadedIndex = [NSMutableSet setWithCapacity:100];
    NSArray *indices = [self createArrayWithLocation:self.loadIndex Length:20];
    [self.loadedIndex addObjectsFromArray:indices];
}

- (NSArray *)createArrayWithLocation:(NSInteger)loc Length:(NSInteger)len {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:len];
    for (int i = 0; i < len; i++) {
        [array addObject:@(loc)];
        loc++;
    }
    return [array copy];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.firstLoad) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.005 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 跳转到tableView中部
            self.tableHeight = tableView.contentSize.height;
            NSLog(@"tableHeight - %f", self.tableHeight);
            CGPoint offset = self.tableView.contentOffset;
            offset.y = self.tableHeight/2;
            self.tableView.contentOffset = offset;
            
            self.firstLoad = NO;
        });
    }
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.heightArray objectAtIndex:indexPath.row] floatValue];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = self.dataArray[indexPath.row];
}

- (void)addCellsAtTopButtonPressed:(id)sender {
    
    CGPoint offset = self.tableView.contentOffset;
    JMLog(NSStringFromCGPoint(offset));
    for (int i = 0; i < 10; i++) {
        NSString *str = [NSString stringWithFormat:@"%d", count];
        [self.dataArray insertObject:str atIndex:0];
        count++;
        offset.y += 88;
    }
    JMLog(NSStringFromCGPoint(offset));
    [self.tableView reloadData];
//    offset.y -= 64;
    self.tableView.contentOffset = offset;
}

- (void)addCellsAtBottomButtonPressed:(id)sender {
    NSString *str = [NSString stringWithFormat:@"%d", count];
    [self.dataArray addObject:str];
    [self.tableView reloadData];
    count++;
}

- (void)addCellsAtTop {
    self.loadIndex -= 20;
    if (![self.loadedIndex containsObject:@(self.loadIndex)]) {
        if (self.loadIndex >= 0) {
            NSArray *subArray = [self.allDataArray subarrayWithRange:NSMakeRange(self.loadIndex, 20)];
            
            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 20)];
            [self.dataArray insertObjects:subArray atIndexes:indexSet];
            
            NSArray *indices = [self createArrayWithLocation:self.loadIndex Length:20];
            [self.loadedIndex addObjectsFromArray:indices];
            
            CGPoint offset = self.tableView.contentOffset;
            NSArray *heightSubArray = [self.heightArray subarrayWithRange:NSMakeRange(self.loadIndex, 20)];
            float totalHeight = [[heightSubArray valueForKeyPath:@"@sum.floatValue"] floatValue];
            offset.y += totalHeight;
            [self.tableView reloadData];
            self.tableHeight = self.tableView.contentSize.height;
            self.tableView.contentOffset = offset;
        } else {
            NSInteger remaining = (self.loadIndex + 20) % 20;
            
            NSArray *subArray = [self.allDataArray subarrayWithRange:NSMakeRange(0, remaining)];
            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, remaining)];
            [self.dataArray insertObjects:subArray atIndexes:indexSet];
            
            NSArray *indices = [self createArrayWithLocation:self.loadIndex Length:remaining];
            [self.loadedIndex addObjectsFromArray:indices];
            
            CGPoint offset = self.tableView.contentOffset;
            NSArray *heightSubArray = [self.heightArray subarrayWithRange:NSMakeRange(0, remaining)];
            float totalHeight = [[heightSubArray valueForKeyPath:@"@sum.floatValue"] floatValue];
            offset.y += totalHeight;
            [self.tableView reloadData];
            self.tableHeight = self.tableView.contentSize.height;
            self.tableView.contentOffset = offset;
            
            self.loadIndex = 0;
        }
    }
}

- (void)addCellsAtBottom {
    self.loadIndex += 20;
    
    if (![self.loadedIndex containsObject:@(self.loadIndex)]) {
        if (self.loadIndex < self.allDataArray.count-1) {
            NSArray *subArray = [self.allDataArray subarrayWithRange:NSMakeRange(self.loadIndex, 20)];
            [self.dataArray addObjectsFromArray:subArray];
            
            NSArray *indices = [self createArrayWithLocation:self.loadIndex Length:20];
            [self.loadedIndex addObjectsFromArray:indices];
            
            [self.tableView reloadData];
            self.tableHeight = self.tableView.contentSize.height;
        } else {
            self.loadIndex = self.allDataArray.count-1;
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //    JMLog(NSStringFromCGPoint(self.tableView.contentOffset));
    CGFloat currentY = self.tableView.contentOffset.y;
    
    //    NSLog(@"Height: %f --- offsetY: %f", self.tableHeight, currentY);
    
    // 接近顶部
    if (currentY < 340) {
        [self addCellsAtTop];
    }
    
    // 接近底部
    if (self.tableHeight - SCREEN_HEIGHT - currentY < 340) {
        [self addCellsAtBottom];
    }
}


@end
