//
//  JMTableViewController.m
//  LearningCodes
//
//  Created by Tony on 2019/8/23.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "JMTableViewController.h"

#import "NSArray+JMSubArray.h"
#import "JMTableViewCell.h"


static NSString *DynamicCell = @"DynamicCell";
static const NSInteger cellCount = 500;
static NSString *TopCellIndexKey = @"TopCellRowKey";

@interface JMTableViewController ()

// Mock
@property (strong, nonatomic) NSMutableArray *mockDataArray;
@property (strong, nonatomic) NSMutableArray *mockHeightArray;

// 数据
@property (strong, nonatomic) NSMutableArray *cellDataArray;
@property (strong, nonatomic) NSMutableArray *cellHeightArray;
@property (assign, nonatomic) CGFloat tableHeight;

// 标志
@property (assign, nonatomic) NSInteger topCellIndex;
@property (assign, nonatomic) BOOL isFirstLoad;
// 初始化时的CellIndex
@property (assign, nonatomic) NSInteger initialCellIndex;
// 运行中读取数据的index
@property (assign, nonatomic) NSInteger loadTopPos;
@property (assign, nonatomic) NSInteger loadBottomPos;
@property (strong, nonatomic) NSMutableSet *loadedIndexSet;

@end

@implementation JMTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"TableView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.isFirstLoad = YES;
    
    [self initMockData];
    
    [self initData];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 保存进度
    UITableViewCell *topCell = [[self.tableView visibleCells] firstObject];
    NSIndexPath *idp = [self.tableView indexPathForCell:topCell];
    [NSUserDefaults jk_setObject:@(idp.row) forKey:TopCellIndexKey];
    
}

#pragma mark - Inits
- (void)initMockData {
    // Mock
    self.mockDataArray = [NSMutableArray arrayWithCapacity:cellCount];
    self.mockHeightArray = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < cellCount; i++) {
        [self.mockDataArray addObject:[NSString stringWithFormat:@"%d", i]];
        
        float height = 88*((i%3)+1);
        [self.mockHeightArray addObject:@(height)];
    }
}

- (void)initData {
    self.cellDataArray = [NSMutableArray arrayWithCapacity:10];
    self.cellHeightArray = [NSMutableArray arrayWithCapacity:10];
    
    // 前十个和后十个作为特殊情况，其他情况则读取topCellRow的前后十个
    // 并把tableView移动到中间位置，也就是topCellIndex所在位置
    self.topCellIndex = [NSUserDefaults jk_integerForKey:TopCellIndexKey];
    NSDictionary *retDic = [self.mockDataArray jm_subArrayWithCenter:self.topCellIndex Radius:10];
    NSArray *subArray = retDic[JM_SUBARRAYKEY];
    self.initialCellIndex = [retDic[JM_NEWTOPKEY] integerValue];
    
    // 当前tableView最顶的cell的index
    self.loadTopPos = [retDic[JM_LOAD_TOP_POS_KEY] integerValue];
    self.loadBottomPos = [retDic[JM_LOAD_BOTTOM_POS_KEY] integerValue];
    self.loadedIndexSet = [NSMutableSet setWithCapacity:10];
    [self.loadedIndexSet addObjectsFromArray:@[@(self.loadTopPos), @(self.loadBottomPos)]];
    
    [self.cellDataArray addObjectsFromArray:subArray];
    
    retDic = [self.mockHeightArray jm_subArrayWithCenter:self.topCellIndex Radius:10];
    subArray = retDic[JM_SUBARRAYKEY];
    [self.cellHeightArray addObjectsFromArray:subArray];
    
    // 刷新tableView
    [self.tableView reloadData];

}

- (void)initUI {
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.isFirstLoad) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.005 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 读取上次阅读位置
            NSIndexPath *idp = [NSIndexPath indexPathForRow:self.initialCellIndex inSection:0];
            [self.tableView scrollToRowAtIndexPath:idp atScrollPosition:UITableViewScrollPositionTop animated:NO];
        });
        self.isFirstLoad = NO;
    }

    return self.cellDataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.cellHeightArray objectAtIndex:indexPath.row] floatValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DynamicCell];
    
    if (cell == nil) {
        cell = [[JMTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DynamicCell];
    }
    
    [self configureCells:cell AtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCells:(JMTableViewCell *)cell AtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = [self.cellDataArray objectAtIndex:indexPath.row];
}

#pragma mark - Adding Cells
- (void)addCellsAtTop {
    self.loadTopPos -= 20;
    if (![self.loadedIndexSet containsObject:@(self.loadTopPos)]) {
//        if (self.loadIndex >= 0) {
//            NSArray *subArray = [self.mockDataArray subarrayWithRange:NSMakeRange(self.loadIndex, 20)];
//
//            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 20)];
//            [self.cellDataArray insertObjects:subArray atIndexes:indexSet];
//
//            NSArray *indices = [self createArrayWithLocation:self.loadIndex Length:20];
//            [self.loadedIndexSet addObjectsFromArray:indices];
//
//            CGPoint offset = self.tableView.contentOffset;
//            NSArray *heightSubArray = [self.mockHeightArray subarrayWithRange:NSMakeRange(self.loadIndex, 20)];
//            [self.cellHeightArray insertObjects:heightSubArray atIndexes:indexSet];
//            float totalHeight = [[heightSubArray valueForKeyPath:@"@sum.floatValue"] floatValue];
//            offset.y += totalHeight;
//            [self.tableView reloadData];
//            self.tableHeight = self.tableView.contentSize.height;
//            self.tableView.contentOffset = offset;
//        } else {
//            NSInteger remaining = (self.loadIndex + 20) % 20;
//            self.loadIndex = 0;
//
//            NSArray *subArray = [self.mockDataArray subarrayWithRange:NSMakeRange(0, remaining)];
//            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, remaining)];
//            [self.cellDataArray insertObjects:subArray atIndexes:indexSet];
//
//            NSArray *indices = [self createArrayWithLocation:self.loadIndex Length:remaining];
//            [self.loadedIndexSet addObjectsFromArray:indices];
//
//            CGPoint offset = self.tableView.contentOffset;
//            NSArray *heightSubArray = [self.mockHeightArray subarrayWithRange:NSMakeRange(self.loadIndex, 20)];
//            [self.cellHeightArray insertObjects:heightSubArray atIndexes:indexSet];
//            float totalHeight = [[heightSubArray valueForKeyPath:@"@sum.floatValue"] floatValue];
//            offset.y += totalHeight;
//            [self.tableView reloadData];
//            self.tableHeight = self.tableView.contentSize.height;
//            self.tableView.contentOffset = offset;
//        }
    }
}

- (void)addCellsAtBottom {
    self.loadBottomPos += 20;
    
    if (![self.loadedIndexSet containsObject:@(self.loadBottomPos)]) {
        if (self.loadBottomPos < self.mockDataArray.count-1) {
            NSArray *subArray = [self.mockDataArray subarrayWithRange:NSMakeRange(self.loadBottomPos, 20)];
            [self.cellDataArray addObjectsFromArray:subArray];
            
            NSArray *indices = [self createArrayWithLocation:self.loadBottomPos Length:20];
            [self.loadedIndexSet addObjectsFromArray:indices];
            
            NSArray *heightSubArray = [self.mockHeightArray subarrayWithRange:NSMakeRange(self.loadBottomPos, 20)];
            [self.cellHeightArray addObjectsFromArray:heightSubArray];
            
            [self.tableView reloadData];
            self.tableHeight = self.tableView.contentSize.height;
        } else {
            self.loadBottomPos = self.mockDataArray.count-1;
        }
    }
}

- (NSArray *)createArrayWithLocation:(NSInteger)loc Length:(NSInteger)len {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:len];
    for (int i = 0; i < len; i++) {
        [array addObject:@(loc)];
        loc++;
    }
    return [array copy];
}

#pragma mark - ScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
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

#pragma mark - Request Data


@end
