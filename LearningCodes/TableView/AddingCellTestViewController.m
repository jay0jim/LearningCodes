//
//  AddingCellTestViewController.m
//  LearningCodes
//
//  Created by Tony on 2019/8/4.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "AddingCellTestViewController.h"

static NSInteger count = 10;

@interface AddingCellTestViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UIButton *addTopButton;
@property (strong, nonatomic) UIButton *addBottomButton;

@end

@implementation AddingCellTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Adding Cells";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dataArray = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < 10; i++) {
        [self.dataArray addObject:[NSString stringWithFormat:@"%d", i]];
    }

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 88;
    [self.view addSubview:self.tableView];
    
    self.addTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addTopButton setTitle:@"从上添加" forState:UIControlStateNormal];
    [self.addTopButton setBackgroundColor:[UIColor greenColor]];
    [self.addTopButton addTarget:self action:@selector(addCellsAtTopButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addTopButton];
    [self.addTopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).with.offset(50);
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(-80);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    
    self.addBottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addBottomButton setTitle:@"从下添加" forState:UIControlStateNormal];
    [self.addBottomButton setBackgroundColor:[UIColor blueColor]];
    [self.addBottomButton addTarget:self action:@selector(addCellsAtBottomButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addBottomButton];
    [self.addBottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right).with.offset(-50);
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(-80);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = self.dataArray[indexPath.row];
}

- (void)addCellsAtTopButtonPressed:(id)sender {
    NSString *str = [NSString stringWithFormat:@"%d", count];
    [self.dataArray insertObject:str atIndex:0];
    NSIndexPath *idp = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[idp] withRowAnimation:UITableViewRowAnimationNone];
    count++;
}

- (void)addCellsAtBottomButtonPressed:(id)sender {
    NSString *str = [NSString stringWithFormat:@"%d", count];
    [self.dataArray addObject:str];
    NSIndexPath *idp = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[idp] withRowAnimation:UITableViewRowAnimationNone];
    count++;
}


@end
