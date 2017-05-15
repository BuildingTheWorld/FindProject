//
//  QTDetailViewController.m
//  FindProjectDemo
//
//  Created by I on 2017/5/12.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTDetailViewController.h"

#import "QTCommentCell.h"

static NSString * const CellID = @"CellID";

@interface QTDetailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *commentTableView;

@end

@implementation QTDetailViewController

#pragma mark - lazy

- (UITableView *)commentTableView
{
    if (_commentTableView == nil) {
        _commentTableView = [[UITableView alloc] init];
        
        _commentTableView.dataSource = self;
        _commentTableView.delegate = self;
        
        [_commentTableView registerClass:[QTCommentCell class] forCellReuseIdentifier:CellID];
        
        _commentTableView.rowHeight = UITableViewAutomaticDimension;
        
        _commentTableView.estimatedRowHeight = 60 * SCALE_6S_HEIGHT;
    }
    
    return _commentTableView;
}

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor cyanColor];
    
    [self.view addSubview:self.commentTableView];
    
    self.commentTableView.frame = self.view.bounds;
}

#pragma mark - commentTableView data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QTCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - commentTableView delegate



@end
