//
//  TLCollectionViewController.m
//  LearningCodes
//
//  Created by Tony on 2020/10/30.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TLCollectionViewController.h"
#import "TLFlowLayout.h"

@interface TLCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (copy, nonatomic) NSArray *colors;

@end

@implementation TLCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    // 创建layout
    TLFlowLayout *layout = [[TLFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    layout.itemCount = 100;
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 5;
    layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    
    // 创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    // 注册item类型
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    
    [self.view addSubview:collectionView];

    NSString *colorsPath = [[NSBundle mainBundle] pathForResource:@"rgba.txt" ofType:nil];
    NSString *colorsStr = [NSString stringWithContentsOfFile:colorsPath encoding:NSUTF8StringEncoding error:nil];
    NSArray *colorsStrArray = [colorsStr componentsSeparatedByString:@"\n"];
    self.colors = colorsStrArray;
    
}

#pragma mark - Collection view delegate and datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    TLFlowLayout *layout = (TLFlowLayout *)collectionView.collectionViewLayout;
    layout.itemCount = self.colors.count;
    return self.colors.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    
    cell.backgroundColor = [self colorWithString:self.colors[indexPath.row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    CGRect cellRectInView = [collectionView convertRect:cell.frame toView:self.view];
    NSLog(@"cell frame: %@", NSStringFromCGRect(cell.frame));
    NSLog(@"frame in view: %@", NSStringFromCGRect(cellRectInView));
}

#pragma mark UICollectionViewDelegateFlowLayout
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    CGFloat itemWidth = SCREEN_WIDTH/2;
//    CGFloat itemHeight = itemWidth * 4/3;
//
//    return CGSizeMake(itemWidth, itemHeight);
//}

#pragma mark - Helpers
- (UIColor *)colorWithString:(NSString *)colorStr {
    CGFloat c[4];
    NSArray *color = [colorStr componentsSeparatedByString:@" "];
    for (int i = 0; i < color.count; i++) {
        c[i] = [color[i] floatValue];
    }
    
    return [UIColor colorWithRed:c[0]
                           green:c[1]
                            blue:c[2]
                           alpha:c[3]];
    
}

@end
