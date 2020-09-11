//
//  TableViewTestViewController.m
//  LearningCodes
//
//  Created by Tony on 2020/9/8.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TableViewTestViewController.h"

@interface TableViewTestViewController ()

@property (strong, nonatomic) NSMutableArray *feedData;

@end

@implementation TableViewTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.feedData = @[].mutableCopy;
        
        NSMutableArray *data = @[].mutableCopy;
        for (int i = 0; i < 50; i++) {
            [data jk_addInt:i];
        }
        
        [self.feedData addObject:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.feedData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.feedData[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    [self configureCell:cell atIndexPath:indexPath];
    NSLog(@"cellForRow - %ld", indexPath.row);
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.feedData[indexPath.section][indexPath.row]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"heightForRowAtIndexPath - %ld", indexPath.row);
    return 60;
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didEndDisplayingCell - %ld", indexPath.row);
//    if ([tableView.indexPathsForVisibleRows indexOfObject:indexPath] == NSNotFound) {
//        NSLog(@"didEndDisplayingCell - %ld", indexPath.row);
//    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"willDisplayCell - %@", cell.textLabel.text);
}

@end
