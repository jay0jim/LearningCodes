//
//  DownloaderViewController.h
//  LearningCodes
//
//  Created by Tony on 2019/9/26.
//  Copyright © 2019 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DownloaderViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *startDownloadBtn;
@property (weak, nonatomic) IBOutlet UIButton *pauseBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

- (IBAction)downloadButtonPressed:(id)sender;
- (IBAction)pauseBtnPressed:(id)sender;
- (IBAction)cancelBtnPressed:(id)sender;

@end

NS_ASSUME_NONNULL_END
