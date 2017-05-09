//
//  QTOfficialViewController.m
//  FindProjectDemo
//
//  Created by I on 2017/5/5.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTOfficialViewController.h"

@interface QTOfficialViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) UICollectionView *officialCollectionView;

@end

@implementation QTOfficialViewController


#pragma mark - 懒加载

- (UICollectionView *)officialCollectionView
{
    if (_officialCollectionView == nil) {
        
        UICollectionViewFlowLayout *officialLayout = [[UICollectionViewFlowLayout alloc] init];
        
        officialLayout.itemSize = CGSizeMake(SCREEN_WIDTH, 333 * SCALE_6S_HEIGHT);
        
        officialLayout.minimumLineSpacing = 0;
        
        officialLayout.minimumInteritemSpacing = 0;
        
        _officialCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:officialLayout];
        
        _officialCollectionView.dataSource = self;
        
        _officialCollectionView.delegate = self;
        
//        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        [_officialCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"officialCollectionViewCell"];
        
        
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
    return 50;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.officialCollectionView dequeueReusableCellWithReuseIdentifier:@"officialCollectionViewCell" forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0
                                                       green:arc4random_uniform(255) / 255.0
                                                        blue:arc4random_uniform(255) / 255.0
                                                       alpha:1];
    
    return cell;
}


#pragma mark - officialCollectionView delegate





@end
