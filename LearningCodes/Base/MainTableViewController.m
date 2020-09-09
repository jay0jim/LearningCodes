//
//  MainTableViewController.m
//  LearningCodes
//
//  Created by Tony on 2019/6/28.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()

@property (strong, nonatomic) NSMutableArray *catagoryArray;
@property (strong, nonatomic) NSMutableArray *classNames;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.title = @"Learning Codes";
    
    self.catagoryArray = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    
    [self addCellTitle:@"RunLoop"
             ClassName:@"RunLoopTestViewController"];
    [self addCellTitle:@"GCD"
             ClassName:@"GCDTestViewController"];
    [self addCellTitle:@"JS"
             ClassName:@"JSViewController"];
    [self addCellTitle:@"BasicTest"
             ClassName:@"BasicTestViewController"];
    [self addCellTitle:@"Adding Cells"
             ClassName:@"JMTableViewController"];
    [self addCellTitle:@"Downloader"
             ClassName:@"DownloaderViewController"];
    [self addCellTitle:@"YYText"
             ClassName:@"TTTextTestViewController"];
    [self addCellTitle:@"Dynamic Cell Height"
             ClassName:@"DynamicCellHeightViewController"];
    [self addCellTitle:@"Table View Test"
             ClassName:@"TableViewTestViewController"];
    [self addCellTitle:@"Dynamic Cell Count" ClassName:@"DynamicCellCountViewController"];

}

- (void)addCellTitle:(NSString *)title ClassName:(NSString *)className {
    [self.catagoryArray jk_addObj:title];
    [self.classNames jk_addObj:className];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.catagoryArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainTableCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainTableCell"];
    }
    
    cell.textLabel.text = self.catagoryArray[indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *className = [self.classNames jk_objectWithIndex:indexPath.row];
    Class class = NSClassFromString(className);
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *vc = nil;
    @try {
        vc = [storyboard instantiateViewControllerWithIdentifier:className];
    } @catch (NSException *exception) {
        NSLog(@"Reason: %@", exception.reason);
    } @finally {
        if (vc == nil) {
            vc = [class new];
            vc.title = [self.catagoryArray jk_objectWithIndex:indexPath.row];
        }
    }
    [self.navigationController pushViewController:vc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
