//
//  QTPinterestViewController.m
//  FindProjectDemo
//
//  Created by I on 2017/5/5.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTPinterestViewController.h"

@interface QTPinterestViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) UICollectionView *pinterestCollectionView;

@end

@implementation QTPinterestViewController

#pragma mark - 懒加载

- (UICollectionView *)pinterestCollectionView
{
    if (_pinterestCollectionView == nil)
    {
        UICollectionViewFlowLayout *pinteresLayout = [[UICollectionViewFlowLayout alloc] init];
        
        pinteresLayout.itemSize = CGSizeMake(SCREEN_WIDTH, 333 * SCALE_6S_HEIGHT);
        
        pinteresLayout.minimumLineSpacing = 0;
        
        pinteresLayout.minimumInteritemSpacing = 0;
        
        _pinterestCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:pinteresLayout];
        
        _pinterestCollectionView.dataSource = self;
        
        _pinterestCollectionView.delegate = self;
        
        [_pinterestCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"pinterestCollectionViewCell"];
    }
    
    return _pinterestCollectionView;
}

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.pinterestCollectionView];
}

#pragma mark - pinterestCollectionView datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.pinterestCollectionView dequeueReusableCellWithReuseIdentifier:@"pinterestCollectionViewCell" forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0
                                                       green:arc4random_uniform(255) / 255.0
                                                        blue:arc4random_uniform(255) / 255.0
                                                       alpha:1];
    
    return cell;
}

#pragma mark - pinterestCollectionView delegate




@end
