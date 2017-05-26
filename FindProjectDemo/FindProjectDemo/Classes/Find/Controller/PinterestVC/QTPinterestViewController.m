//
//  QTPinterestViewController.m
//  FindProjectDemo
//
//  Created by I on 2017/5/5.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTPinterestViewController.h"

#import "QTPinterestCollectionViewCell.h"

#import "QTDetailViewController.h"

@interface QTPinterestViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) UICollectionViewFlowLayout *pinterestFlowLayout;

@property (strong, nonatomic) UICollectionView *pinterestCollectionView;

@end

@implementation QTPinterestViewController

#pragma mark - lazy

- (UICollectionViewFlowLayout *)pinterestFlowLayout
{
    if (_pinterestFlowLayout == nil) {
        _pinterestFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        _pinterestFlowLayout.estimatedItemSize = CGSizeMake(SCREEN_WIDTH, 625 * SCALE_6S_HEIGHT);
        
        _pinterestFlowLayout.itemSize = UICollectionViewFlowLayoutAutomaticSize;
        
        _pinterestFlowLayout.minimumLineSpacing = 0;
        
        _pinterestFlowLayout.minimumInteritemSpacing = 0;
    }
    
    return _pinterestFlowLayout;
}

- (UICollectionView *)pinterestCollectionView
{
    if (_pinterestCollectionView == nil)
    {
        _pinterestCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.pinterestFlowLayout];
        
        _pinterestCollectionView.dataSource = self;
        
        _pinterestCollectionView.delegate = self;
        
        [_pinterestCollectionView registerClass:[QTPinterestCollectionViewCell class] forCellWithReuseIdentifier:@"pinterestCollectionViewCell"];
    }
    
    return _pinterestCollectionView;
}

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.pinterestCollectionView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    // 监听 TopCycleView 点击
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"TopCycleViewClick" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        
        UITouch *currentTouch = [note.userInfo objectForKey:@"currentTouch"];
        
        CGPoint currentPoint = [currentTouch locationInView:self.pinterestCollectionView];

        NSIndexPath *currentIndexPath = [self.pinterestCollectionView indexPathForItemAtPoint:currentPoint];
        
        
        NSLog(@"%@",currentIndexPath);
        
        // 根据 indexPath 从模型数组中取出 对应行的模型
        
        QTDetailViewController *detailVC = [[QTDetailViewController alloc] init];
        
        // 在 detailVC 定义一个属性, 用来接收 对应的模型
        
        detailVC.hidesBottomBarWhenPushed = YES;
        
        if (self.navigationController.childViewControllers.count == 2)
        {
            return;
        }
        
        [self.navigationController pushViewController:detailVC animated:YES];
        
    }];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"TopCycleViewClick" object:nil];
}


#pragma mark - pinterestCollectionView datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QTPinterestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pinterestCollectionViewCell" forIndexPath:indexPath];
    
//    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0
//                                                       green:arc4random_uniform(255) / 255.0
//                                                        blue:arc4random_uniform(255) / 255.0
//                                                       alpha:1];
    
    return cell;
}

#pragma mark - pinterestCollectionView delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    QTDetailViewController *detailVC = [[QTDetailViewController alloc] init];
    
    detailVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}



@end
