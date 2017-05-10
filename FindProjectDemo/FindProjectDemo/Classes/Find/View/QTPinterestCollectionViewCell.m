//
//  QTPinterestCollectionViewCell.m
//  FindProjectDemo
//
//  Created by I on 2017/5/10.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTPinterestCollectionViewCell.h"

@interface QTPinterestCollectionViewCell () <UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *topCollectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *topFlowLayout;



@end

@implementation QTPinterestCollectionViewCell

#pragma mark - lazy

- (UICollectionViewFlowLayout *)topFlowLayout
{
    if (_topFlowLayout == nil) {
        _topFlowLayout = [[UICollectionViewFlowLayout alloc] init];
#warning TODO
        _topFlowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH);
        
        _topFlowLayout.minimumLineSpacing = 0;
        _topFlowLayout.minimumInteritemSpacing = 0;
        
        _topFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
    }
    
    return _topFlowLayout;
}

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UICollectionView *topCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.topFlowLayout];
        
        self.topCollectionView = topCollectionView;
        
        topCollectionView.dataSource = self;
        
        topCollectionView.pagingEnabled = YES;
        
        [topCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"topCollectionViewCell"];
        
        [self.contentView addSubview:topCollectionView];
        

        
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.topCollectionView makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.contentView);
        
        make.left.equalTo(self.contentView);
        
//        make.right.equalTo(self.contentView);
        
//        make.bottom.equalTo(self.contentView).offset(250 * SCALE_6S_HEIGHT).priority(100);
        
        make.height.offset(SCREEN_WIDTH);
        
        
        make.width.offset(SCREEN_WIDTH);
        
    }];
    
    

    
}





#pragma mark - topCollectionView datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topCollectionViewCell" forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    UIView *blueView = [[UIView alloc] init];
    
    blueView.backgroundColor = [UIColor blueColor];
    
    blueView.frame = CGRectMake(30, 30, 30, 30);
    
    [cell.contentView addSubview:blueView];
    
    return cell;
}







@end
