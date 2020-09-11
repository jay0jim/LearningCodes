//
//  DynamicCellHeightViewController.m
//  LearningCodes
//
//  Created by Tony Lee on 2020/8/30.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "DynamicCellHeightViewController.h"
#import "DynamicCellHeightTableViewCell.h"

#import "JMImageDownloader.h"

typedef void(^CellOperationBlock)(void);

@interface DynamicCellHeightViewController () <UITableViewDelegate, UITableViewDataSource> {
    CFRunLoopObserverRef observer;
}

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *heights;
@property (strong, nonatomic) NSMutableArray *optBlocks;
@property (copy, nonatomic) NSArray *urls;
@property (strong, nonatomic) JMImageDownloader *downloader;

@end

@implementation DynamicCellHeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    self.tableView.estimatedRowHeight = 64;
    
    self.heights = @{}.mutableCopy;
    self.optBlocks = @[].mutableCopy;
    
    self.downloader = [JMImageDownloader sharedInstance];
    

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
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)dealloc {
    NSLog(@"DynamicCellHeightViewController dealloc...");
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.urls.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DynamicCellHeightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"DynamicCellHeightTableViewCell" owner:self options:nil].firstObject;
    }
    NSLog(@"cellForRowAtIndexPath - %ld", indexPath.row);
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
//    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:self.urls[indexPath.row]] placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        CGFloat imgHeight = image.size.height;
//        if (imgHeight > 80) {
//            imgHeight = (imgHeight/image.size.width)*(SCREEN_WIDTH-30);
//        }
//        [self.heights jk_setFloat:70+imgHeight forKey:[NSString stringWithFormat:@"%ld", indexPath.row]];
//        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
//    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"heightForRowAtIndexPath - %ld", indexPath.row);
    
    NSString *key = [NSString stringWithFormat:@"%ld", indexPath.row];
    CGFloat height = [self.heights jk_floatForKey:key];
    if (height <= 0.001) {
        // 默认高度
        height = 150;
    }
    return height;
}

//- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if ([tableView.indexPathsForVisibleRows indexOfObject:indexPath] == NSNotFound) {
//        NSString *urlStr = self.urls[indexPath.row];
//        [self.downloader suspendTaskWithURL:[NSURL URLWithString:urlStr]];
//    }
//}
//
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if ([tableView.indexPathsForVisibleRows indexOfObject:indexPath] != NSNotFound) {
//        NSString *urlStr = self.urls[indexPath.row];
//        [self.downloader resumeTaskWithURL:[NSURL URLWithString:urlStr]];
//    }
//}

- (void)setCellImageWithIndexPath:(NSIndexPath *)indexPath Entity:(NSDictionary *)entity{
    NSLog(@"hhh...");

    
    
    
//    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}



@end
