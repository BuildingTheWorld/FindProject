//
//  QTPageContentView.m
//  FindProjectDemo
//
//  Created by I on 2017/5/5.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTPageContentView.h"


NSString *CellID = @"cellid";


@interface QTPageContentView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSArray *childVcArray;

@property (weak, nonatomic) UIViewController *parentVc;

@property (strong, nonatomic) UICollectionView *pageCollectionView;

@end


@implementation QTPageContentView

#pragma mark - 自定义构造方法

- (instancetype)initWithFrame:(CGRect)frame childVcArray:(NSArray *)childVcArray parentViewController:(UIViewController *)parentController
{
    if (self = [super initWithFrame:frame])
    {
        self.childVcArray = childVcArray;
        
        self.parentVc = parentController;
    }
    
    [self setUpSubViews];
        
    return self;
}


#pragma mark - 懒加载

- (UICollectionView *)pageCollectionView
{
    if (_pageCollectionView == nil)
    {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        flowLayout.itemSize = self.bounds.size;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _pageCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        
        _pageCollectionView.dataSource = self;
        _pageCollectionView.delegate = self;

        _pageCollectionView.scrollsToTop = NO;
        _pageCollectionView.bounces = NO;
        _pageCollectionView.showsHorizontalScrollIndicator = NO;
        _pageCollectionView.pagingEnabled = YES;
        
        [_pageCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellID];
    }
    
    return _pageCollectionView;
}


#pragma mark - 添加子控件

- (void)setUpSubViews
{
    // 将所有的子控制器添加父控制器中
    
    for (UIViewController *childVC in self.childVcArray)
    {
        [self.parentVc addChildViewController:childVC];
    }
    
    // 添加 collectionView
    
    [self addSubview:self.pageCollectionView];
    
    self.pageCollectionView.frame = self.bounds;
    
    // 监听 titleClick 通知
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"titleClick" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        
        
        UILabel *tempLabel = [note.userInfo objectForKey:@"currentLabel"];
        
        CGFloat offsetX = tempLabel.tag * self.pageCollectionView.frame.size.width;
        
        [self.pageCollectionView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
        
    }];
    
}

#pragma mark - collectionView data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.childVcArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellID forIndexPath:indexPath];
    
    for (UIView *view in cell.contentView.subviews)
    {
        [view removeFromSuperview];
    }
    
    UIViewController *childVc = self.childVcArray[indexPath.item];
    
    childVc.view.frame = cell.contentView.bounds;
    
    [cell.contentView addSubview:childVc.view];
    
    return cell;
}


#pragma mark - scrollView delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 广播 scrollView 通知
    
    NSDictionary *tempDict = [NSDictionary dictionaryWithObject:scrollView forKey:@"scrollView"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollView" object:nil userInfo:tempDict];
    
}

#pragma mark - 移除 通知

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"titleClick" object:nil];
}


@end
