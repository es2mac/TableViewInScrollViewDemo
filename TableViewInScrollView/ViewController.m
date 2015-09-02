//
//  ViewController.m
//  TableViewInScrollView
//
//  Created by Paul on 9/2/15.
//  Copyright (c) 2015 Mathemusician.net. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, weak) IBOutlet UIButton *addButton;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *tableViewHeight;

@property (nonatomic) NSUInteger rowCount;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewHeight.constant = 0.0;
}

#pragma mark - Table view delegate / data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.0;
}

#pragma mark - Action

- (IBAction)addCell
{
    self.rowCount += 1;

    self.tableViewHeight.constant = self.rowCount * 30.0;

    self.addButton.userInteractionEnabled = NO;

    [UIView animateWithDuration:0.5 animations:^{

        [self.view layoutIfNeeded];

    } completion:^(BOOL finished) {

        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.rowCount - 1 inSection:0];

        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];

        self.addButton.userInteractionEnabled = YES;
    }];
}

@end
