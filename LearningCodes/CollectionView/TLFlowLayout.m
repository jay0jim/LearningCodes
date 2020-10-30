//
//  TLFlowLayout.m
//  LearningCodes
//
//  Created by Tony on 2020/10/30.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TLFlowLayout.h"

/*
 FlowLayout类将每个item的位置等布局信息放在一个数组中，在collectionView布局时，会调用FlowLayout类layoutAttributesForElementsInRect：
 方法来获取这个布局配置数组。因此，我们需要重写这个方法，返回我们自定义的配置数组。
 另外，FlowLayout类在进行布局之前，会调用prepareLayout方法，所以我们可以重写这个方法，在里面对我们的自定义配置 *数据* 进行一些设置。
 
 自定义一个FlowLayout布局类就是两个步骤：

 1、设计好我们的布局配置数据 prepareLayout方法中

 2、返回我们的配置数组 layoutAttributesForElementsInRect方法中
 */

@implementation TLFlowLayout {
    // 布局配置数组
    NSMutableArray      *m_attributeArray;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    m_attributeArray = [NSMutableArray arrayWithCapacity:100];
    
    // 计算item宽度
    CGFloat itemWidth = (SCREEN_WIDTH - self.sectionInset.left - self.sectionInset.right - self.minimumInteritemSpacing)/2;
    // 统计每列高度，把item放在最短的下面
    CGFloat columnHights[2] = {0, 0};
    for (int i = 0;  i < self.itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        // 创建布局属性类 UICollectionViewLayoutAttributes，items的布局由它控制
        UICollectionViewLayoutAttributes *attribs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
#warning 随机高度 
        CGFloat itemHeight = arc4random()%5 * 10 + 180;
        // 找到高度最短的列
        int columnIndex = 0;
        if (columnHights[0] <= columnHights[1]) {
            columnHights[0] += (itemHeight + self.minimumLineSpacing);
        } else {
            columnHights[1] += (itemHeight + self.minimumLineSpacing);
            columnIndex = 1;
        }
        
        // 设置item的位置
        attribs.frame = CGRectMake(self.sectionInset.left + (self.minimumInteritemSpacing + itemWidth) * columnIndex,
                                   columnHights[columnIndex] - itemHeight - self.minimumLineSpacing,
                                   itemWidth,
                                   itemHeight);
        // 把属性添加到 布局配置数组 中
        [m_attributeArray addObject:attribs];
    }
    
    //设置itemSize来确保滑动范围的正确 这里是通过将所有的item高度平均化，计算出来的(以最高的列位标准)
    if (columnHights[0]>columnHights[1]) {
        self.itemSize = CGSizeMake(itemWidth, (columnHights[0]-self.sectionInset.top)*2/self.itemCount - self.minimumLineSpacing);
    } else {
        self.itemSize = CGSizeMake(itemWidth, (columnHights[1]-self.sectionInset.top)*2/self.itemCount - self.minimumLineSpacing);
    }
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return m_attributeArray;
}

@end
