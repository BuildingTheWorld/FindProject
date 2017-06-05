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

#pragma mark - lazy

- (QTPageTitleView *)pageTitleView
{
    if (_pageTitleView == nil)
    {
        NSArray *titleArray = @[@"官方", @"用户"];
        
        _pageTitleView = [[QTPageTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 34 * SCALE_6S_HEIGHT) titles:titleArray];
    }
    
    return _pageTitleView;
}

- (QTPageContentView *)pageContentView
{
    if (_pageContentView == nil)
    {
        
//        QTOfficialViewController *officialVc = [[QTOfficialViewController alloc] init];
        
        QTPinterestViewController *pinterestVc1 = [[QTPinterestViewController alloc] init];
        
        QTPinterestViewController *pinterestVc2 = [[QTPinterestViewController alloc] init];

        NSArray *childVcArray = [NSArray arrayWithObjects:pinterestVc1, pinterestVc2, nil];
        
        _pageContentView = [[QTPageContentView alloc] initWithFrame:CGRectMake(0, 34 * SCALE_6S_HEIGHT, SCREEN_WIDTH, self.view.bounds.size.height) childVcArray:childVcArray parentViewController:self];
        
        _pageContentView.backgroundColor = [UIColor lightGrayColor];
        

    }
    
    return _pageContentView;
}

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
//    self.view.autoresizingMask = NO;
    
    [self setUpNavigationBar];
    
    [self setUpSubViews];
 
    // loadData
    
    [self loadData];
}

#pragma mark - setUpNavigationBar

- (void)setUpNavigationBar
{
    UIColor *navColor = [UIColor colorWithHexValue:0xFBFAFA alpha:1];
    
    UIImage *navImage = [UIImage imageWithColor:navColor];
    
    [self.navigationController.navigationBar setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationItem.title = @"青酱说";
}

#pragma mark - setUpSubViews

- (void)setUpSubViews
{
    [self.view addSubview:self.pageTitleView];
    
    [self.view addSubview:self.pageContentView];
    
}

#pragma mark - network

- (void)loadData
{
    
#warning TODO
    
    // 请求成功后, 分别把数据传递给 pinterestVc1 和 pinterestVc2 中 modelArray
}

@end
