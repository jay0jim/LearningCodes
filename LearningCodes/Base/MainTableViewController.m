//
//  MainTableViewController.m
//  LearningCodes
//
//  Created by Tony on 2019/6/28.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "MainTableViewController.h"

#import "RunLoopTestViewController.h"
#import "GCDTestViewController.h"
#import "JSViewController.h"
#import "BasicTestViewController.h"
#import "AddingCellTestViewController.h"

@interface MainTableViewController ()

@property (strong, nonatomic) NSArray *catagoryArray;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.title = @"Learning Codes";
    
    self.catagoryArray = @[@"RunLoop", @"GCD", @"JS", @"BasicTest", @"Adding Cells"];

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
    
    if (indexPath.row == 0) {
        RunLoopTestViewController *vc = [[RunLoopTestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 1) {
        GCDTestViewController *vc = [[GCDTestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 2) {
        JSViewController *vc = [[JSViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 3) {
        BasicTestViewController *vc = [[BasicTestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 4) {
        AddingCellTestViewController *vc = [[AddingCellTestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}




@end
