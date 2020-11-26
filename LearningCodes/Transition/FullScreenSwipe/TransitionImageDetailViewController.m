//
//  TransitionImageDetailViewController.m
//  LearningCodes
//
//  Created by Tony on 2020/11/25.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TransitionImageDetailViewController.h"

#import "TLFullScreenSwipeTransitionDelegate.h"

@interface TransitionImageDetailViewController ()

@end

@implementation TransitionImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBack:)];
    tapGesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapGesture];
    
    UIImage *img = [UIImage imageNamed:@"testImage.jpg"];
    CGFloat imgWidth = img.size.width;
    CGFloat imgHeight = img.size.height;
    CGFloat ratio = imgWidth / SCREEN_WIDTH;
    CGFloat ratioHeight = imgHeight / ratio;
    
    self.detailImageView = [[UIImageView alloc] initWithImage:img];
    self.detailImageView.contentMode = UIViewContentModeScaleAspectFit;
    CGRect imgViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, ratioHeight);
    self.detailImageView.frame = imgViewFrame;
    [self.view addSubview:self.detailImageView];
//    [self.detailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self.view.mas_centerX);
//        make.height.mas_equalTo(ratioHeight);
//        make.width.mas_equalTo(SCREEN_WIDTH);
//        
//        if (ratioHeight > SCREEN_HEIGHT) {
//            make.top.mas_equalTo(0);
//        } else {
//            make.centerY.mas_equalTo(self.view.mas_centerY);
//        }
//    }];
    
}

- (void)tapBack:(UITapGestureRecognizer *)sender {
    if ([self.transitioningDelegate isKindOfClass:TLFullScreenSwipeTransitionDelegate.class]) {
        TLFullScreenSwipeTransitionDelegate *customDelegate = self.transitioningDelegate;
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
