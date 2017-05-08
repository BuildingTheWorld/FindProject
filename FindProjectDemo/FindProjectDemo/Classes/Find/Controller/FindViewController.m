//
//  FindViewController.m
//  FindProjectDemo
//
//  Created by I on 2017/5/5.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "FindViewController.h"
#import "QTPageTitleView.h"
#import "QTPageContentView.h"

#import "QTOfficialViewController.h"
#import "QTPinterestViewController.h"

@interface FindViewController ()

@property (strong, nonatomic) QTPageTitleView *pageTitleView; // 标题栏View

@property (strong, nonatomic) QTPageContentView *pageContentView; // 内容View

@end

@implementation FindViewController

#pragma mark - 懒加载

- (QTPageTitleView *)pageTitleView
{
    if (_pageTitleView == nil)
    {
        NSArray *titleArray = @[@"官方", @"用户"];
        
        _pageTitleView = [[QTPageTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 34 * SCALE_6S_HEIGHT) titles:titleArray];
        
//        _pageTitleView.backgroundColor = [UIColor greenColor];
    }
    
    return _pageTitleView;
}

- (QTPageContentView *)pageContentView
{
    if (_pageContentView == nil)
    {
        
        QTOfficialViewController *officialVc = [[QTOfficialViewController alloc] init];
        
        QTPinterestViewController *pinterestVc = [[QTPinterestViewController alloc] init];
        
        NSArray *childVcArray = [NSArray arrayWithObjects:officialVc, pinterestVc, nil];
        
        _pageContentView = [[QTPageContentView alloc] initWithFrame:CGRectMake(0, 34 * SCALE_6S_HEIGHT, SCREEN_WIDTH, self.view.bounds.size.height) childVcArray:childVcArray parentViewController:self];
        
        _pageContentView.backgroundColor = [UIColor lightGrayColor];
    }
    
    return _pageContentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self setUpSubViews];
}

#pragma mark - setUpSubViews

- (void)setUpSubViews
{
    [self.view addSubview:self.pageTitleView];
    
    [self.view addSubview:self.pageContentView];
}

@end
