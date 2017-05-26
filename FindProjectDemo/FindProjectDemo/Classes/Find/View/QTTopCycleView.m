//
//  QTTopCycleView.m
//  FindProjectDemo
//
//  Created by I on 2017/5/11.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTTopCycleView.h"

#import "QTTopCollectionViewCell.h"

#import "QTDetailViewController.h"

#import "QTPinterestViewController.h"

#import "QTTopCycleCollectionView.h"

@interface QTTopCycleView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;

@property (strong, nonatomic) QTTopCycleCollectionView *cycleCollectionView;

@property (strong, nonatomic) UIView *pageCountView;

@property (strong, nonatomic) UILabel *pageCountLabel;

@end

@implementation QTTopCycleView

#pragma mark - lazy

- (UICollectionViewFlowLayout *)flowLayout
{
    if (_flowLayout == nil)
    {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        _flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH);
        
        _flowLayout.minimumLineSpacing = 0;
        _flowLayout.minimumInteritemSpacing = 0;
        
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    
    return _flowLayout;
}


- (QTTopCycleCollectionView *)cycleCollectionView
{
    if (_cycleCollectionView == nil) {
        
        _cycleCollectionView = [[QTTopCycleCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];

        _cycleCollectionView.dataSource = self;
        _cycleCollectionView.delegate = self;
        _cycleCollectionView.pagingEnabled = YES;
        
        [_cycleCollectionView registerClass:[QTTopCollectionViewCell class] forCellWithReuseIdentifier:@"topCollectionViewCell"];

    }
    
    return _cycleCollectionView;
}


- (UIView *)pageCountView
{
    if (_pageCountView == nil) {
        _pageCountView = [[UIView alloc] init];
        
        _pageCountView.backgroundColor = [UIColor colorWithHexValue:0xAAA5A2 alpha:0.7];
        
        _pageCountView.layer.cornerRadius = 8;
        _pageCountView.layer.masksToBounds = YES;
        
        [_pageCountView addSubview:self.pageCountLabel];
        
        [self.pageCountLabel makeConstraints:^(MASConstraintMaker *make) {
           
            make.center.equalTo(self.pageCountView.center);
            
        }];
    }
    
    return _pageCountView;
}

- (UILabel *)pageCountLabel
{
    if (_pageCountLabel == nil) {
        _pageCountLabel = [[UILabel alloc] init];
        _pageCountLabel.textColor = [UIColor colorWithHexValue:0xFFFFFF alpha:1];
        _pageCountLabel.font = [UIFont systemFontOfSize:12];
#warning model data
        _pageCountLabel.text = @"1/4";
    }

    return _pageCountLabel;
}



#pragma mark - override init

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        // cycleCollectionView
        
        [self addSubview:self.cycleCollectionView];
        
        [self.cycleCollectionView makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.offset(SCREEN_WIDTH);
            make.height.offset(SCREEN_WIDTH);
            make.top.equalTo(self);
            make.centerX.equalTo(self);
            
        }];
        
        // pageCountView
        
        [self addSubview:self.pageCountView];
        
        [self.pageCountView makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.width.offset(33);
            
            make.height.offset(17);
            
            make.right.equalTo(self).offset(-15);
            
            make.bottom.equalTo(self).offset(-15);
            
        }];
        
    }
    
    return self;
}

#pragma mark - data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QTTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int i = scrollView.contentOffset.x / SCREEN_WIDTH;
    
    self.pageCountLabel.text = [NSString stringWithFormat:@"%d/4",i + 1];
}


@end
