//
//  DownloaderViewController.m
//  LearningCodes
//
//  Created by Tony on 2019/9/26.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "DownloaderViewController.h"

#define URL_STR @"http://61.153.102.131/upgcxcode/94/45/112874594/112874594_nb2-1-80.flv?expires=1569482100&platform=android&ssig=SulA0jUys72iFN0FRujX-g&oi=1877347901&trid=f8ad69df282e41d099a013a797c7d6a4&nfb=maPYqpoel5MI3qOUX6YpRA==&nfc=1&mid=472634959"

@interface DownloaderViewController ()

@property (strong, nonatomic) NSURLSessionDownloadTask *downloadTask;

@end

@implementation DownloaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Downloader";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSURL *url = [NSURL URLWithString:URL_STR];
    [self downloadFileWithURL:url];
}

- (void)downloadButtonPressed:(id)sender {
    NSLog(@"Download Button Pressed!");
    
    [self.downloadTask resume];
    
    self.startDownloadBtn.enabled = NO;
    self.pauseBtn.enabled = YES;
}

- (void)downloadFileWithURL:(NSURL *)url {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    self.downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        //
        int64_t total = downloadProgress.totalUnitCount;
        int64_t total_M = downloadProgress.totalUnitCount/(1024*1024);
        int64_t complete = downloadProgress.completedUnitCount;
        int64_t complete_M = downloadProgress.completedUnitCount/(1024*1024);
        double_t percentage = (complete*1.0)/total * 100;
        NSLog(@"%lf", percentage);
        
        NSString *labelStr = [NSString stringWithFormat:@"%lld MB / %lld MB %.2f%% complete.", complete_M, total_M, percentage];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.progressLabel.text = labelStr;
        });
        
//        NSLog(@"%lld", downloadProgress.completedUnitCount);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        NSLog(@"%@", documentsDirectoryURL);
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        //
        NSLog(@"File downloaded to: %@", filePath);
        self.startDownloadBtn.enabled = YES;
    }];
}

- (void)pauseBtnPressed:(id)sender {
    NSLog(@"Pause Button Pressed!");
    
    if (self.downloadTask != nil) {
        [self.downloadTask suspend];
        self.pauseBtn.enabled = NO;
        self.startDownloadBtn.enabled = YES;
    }
}

- (void)cancelBtnPressed:(id)sender {
    NSLog(@"Cancel Button Pressed!");
    
    if (self.downloadTask != nil) {
        [self.downloadTask cancel];
    }
}

@end
