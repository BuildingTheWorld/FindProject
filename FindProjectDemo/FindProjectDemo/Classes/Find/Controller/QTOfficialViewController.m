//
//  QTOfficialViewController.m
//  FindProjectDemo
//
//  Created by I on 2017/5/5.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTOfficialViewController.h"

#import "QTOfficialCollectionViewCell.h"

@interface QTOfficialViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) UICollectionViewFlowLayout *officialFlowLayout;

@property (strong, nonatomic) UICollectionView *officialCollectionView;

@end

@implementation QTOfficialViewController

#pragma mark - lazy

- (UICollectionViewFlowLayout *)officialFlowLayout
{
    if (_officialFlowLayout == nil) {
        _officialFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        _officialFlowLayout.estimatedItemSize = CGSizeMake(SCREEN_WIDTH, 333 * SCALE_6S_HEIGHT);
        
        _officialFlowLayout.itemSize = UICollectionViewFlowLayoutAutomaticSize;
        
        _officialFlowLayout.minimumLineSpacing = 0;
        
        _officialFlowLayout.minimumInteritemSpacing = 0;
    }
    
    return _officialFlowLayout;
}

- (UICollectionView *)officialCollectionView
{
    if (_officialCollectionView == nil) {
        
        _officialCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.officialFlowLayout];
        
        _officialCollectionView.dataSource = self;
        
        _officialCollectionView.delegate = self;
        
        [_officialCollectionView registerClass:[QTOfficialCollectionViewCell class] forCellWithReuseIdentifier:@"officialCollectionViewCell"];
    }
    
    return _officialCollectionView;
}

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:self.officialCollectionView];
}

#pragma mark - officialCollectionView datasource


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QTOfficialCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"officialCollectionViewCell" forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0
                                                       green:arc4random_uniform(255) / 255.0
                                                        blue:arc4random_uniform(255) / 255.0
                                                       alpha:1];
    
    return cell;
}


@end
