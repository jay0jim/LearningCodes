//
//  DynamicCellHeightTableViewCell.h
//  LearningCodes
//
//  Created by Tony Lee on 2020/9/3.
//  Copyright © 2020 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DCHLoadButtonBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface DynamicCellHeightTableViewCell : UITableViewCell

@property (copy, nonatomic) DCHLoadButtonBlock callback;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

NS_ASSUME_NONNULL_END
