//
//  DynamicCellHeightTableViewCell.m
//  LearningCodes
//
//  Created by Tony Lee on 2020/9/3.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "DynamicCellHeightTableViewCell.h"

@interface DynamicCellHeightTableViewCell ()

@end

@implementation DynamicCellHeightTableViewCell

- (IBAction)loadButtonPressed:(id)sender {
    if (self.callback) {
        self.callback();
    }
}


@end
