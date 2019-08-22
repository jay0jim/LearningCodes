//
//  RunLoopTestViewController.m
//  LearningCodes
//
//  Created by Tony on 2019/7/12.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "RunLoopTestViewController.h"
#import "JMLagMonitor.h"

@interface RunLoopTestViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation RunLoopTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RunLoopTest";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"timer...");
    }];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 100, 200) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    JMLagMonitor *monitor = [JMLagMonitor sharedInstance];
    [monitor beginMonitor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
}

- (void)dealloc {
    [self.timer invalidate];
    NSLog(@"dealloc..");
    [[JMLagMonitor sharedInstance] endMonitor];
}

@end
