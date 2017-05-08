//
//  QTPageContentView.m
//  FindProjectDemo
//
//  Created by I on 2017/5/5.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTPageContentView.h"

//NSString * titleClick = @"titleClick";

NSString *CellID = @"cellid";


@interface QTPageContentView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSArray *childVcArray;

@property (weak, nonatomic) UIViewController *parentVc;

@property (strong, nonatomic) UICollectionView *pageCollectionView;

//fileprivate var startOffsetX : CGFloat = 0

//fileprivate var isForbidScrollDelegate : Bool = false


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
        
        _pageCollectionView.showsHorizontalScrollIndicator = NO;
        
        _pageCollectionView.pagingEnabled = YES;
        
        _pageCollectionView.bounces = NO;
        
        _pageCollectionView.scrollsToTop = NO;
        
        _pageCollectionView.dataSource = self;
        
        _pageCollectionView.delegate = self;
        
        [_pageCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellID];
        
    }
    
    return _pageCollectionView;
}


#pragma mark - 添加子控件

- (void)setUpSubViews
{
    
    // 1.将所有的子控制器添加父控制器中
    
//    for childVc in childVcs
//    {
//        parentViewController?.addChildViewController(childVc)
//    }
    
    // 添加collectionView
    
    [self addSubview:self.pageCollectionView];
    
    self.pageCollectionView.frame = self.bounds;
    
    // 监听 通知
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"titleClick" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        
        
        UILabel *tempLabel = [note.userInfo objectForKey:@"currentLabel"];
        
        CGFloat offsetX = tempLabel.tag * self.pageCollectionView.frame.size.width;
        
        [self.pageCollectionView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
        
    }];
    
}

#pragma mark - data source

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


#pragma mark - delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
//    NSInteger i = scrollView.contentOffset.x / SCREEN_WIDTH;
    
    // 广播 通知 传值
    
    NSDictionary *tempDict = [NSDictionary dictionaryWithObject:scrollView forKey:@"scrollView"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollView" object:nil userInfo:tempDict];
    
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"titleClick" object:nil];
}


@end
