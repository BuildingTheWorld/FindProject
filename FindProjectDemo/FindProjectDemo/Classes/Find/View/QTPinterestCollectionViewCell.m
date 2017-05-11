//
//  QTPinterestCollectionViewCell.m
//  FindProjectDemo
//
//  Created by I on 2017/5/10.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTPinterestCollectionViewCell.h"

@interface QTPinterestCollectionViewCell () <UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionViewFlowLayout *topFlowLayout;

@property (strong, nonatomic) UICollectionView *topCollectionView;

@property (strong, nonatomic) UIImageView *iconImageView;

@property (strong, nonatomic) UILabel *nameLabel;

@property (strong, nonatomic) UILabel *timeLable;

@property (strong, nonatomic) UILabel *abstractLabel;


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

- (UICollectionView *)topCollectionView
{
    if (_topCollectionView == nil) {
        _topCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.topFlowLayout];
        
        _topCollectionView.dataSource = self;
        
        _topCollectionView.pagingEnabled = YES;
        
        [_topCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"topCollectionViewCell"];
    }
    
    return _topCollectionView;
}

- (UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        
//        _iconImageView.layer.masksToBounds = YES;
//        
//        _iconImageView.layer.cornerRadius = 20;
        
    }
    
    return _iconImageView;
}


- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        
        _nameLabel.text = @"呵呵哈哈哈";
    }
    
    return _nameLabel;
}


- (UILabel *)timeLable
{
    if (_timeLable == nil) {
        _timeLable = [[UILabel alloc] init];
        _timeLable.font = [UIFont systemFontOfSize:10];
        _timeLable.textColor = [UIColor colorWithHexValue:0x949494 alpha:1];
        
        _timeLable.text = @"44分钟前";
    }
    
    return _timeLable;
}


- (UILabel *)abstractLabel
{
    if (_abstractLabel == nil) {
        _abstractLabel = [[UILabel alloc] init];
        _abstractLabel.font = [UIFont systemFontOfSize:15];
        _abstractLabel.numberOfLines = 0;
        
        _abstractLabel.text = @"呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵";
    }
    
    return _abstractLabel;
}


#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // topCollectionView
        [self.contentView addSubview:self.topCollectionView];
        
        // icon
        [self.contentView addSubview:self.iconImageView];
        
        // name
        [self.contentView addSubview:self.nameLabel];
        
        // time
        [self.contentView addSubview:self.timeLable];
        
        // abstract
        [self.contentView addSubview:self.abstractLabel];
        
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.topCollectionView makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.contentView);
        
        make.left.equalTo(self.contentView);
    
        make.height.offset(SCREEN_WIDTH);
        
        make.width.offset(SCREEN_WIDTH);
        
    }];
    
    
    [self.iconImageView makeConstraints:^(MASConstraintMaker *make) {
       
        
        make.top.equalTo(self.topCollectionView.bottom).offset(24 * SCALE_6S_HEIGHT);
        
        make.left.equalTo(self.contentView).offset(24 * SCALE_6S_WIDTH);
        
        make.width.offset(40);
        
        make.height.offset(40);
        
    }];
    
    
    [self.nameLabel makeConstraints:^(MASConstraintMaker *make) {
       
        
        make.left.equalTo(self.iconImageView.right).offset(6);
        
        make.top.equalTo(self.iconImageView);
        
    }];
    
    
    [self.timeLable makeConstraints:^(MASConstraintMaker *make) {
       
        
        make.left.equalTo(self.iconImageView.right).offset(6);
        
        make.bottom.equalTo(self.iconImageView);
        
    }];
    
    
    [self.abstractLabel makeConstraints:^(MASConstraintMaker *make) {
       
    
        make.top.equalTo(self.iconImageView.bottom).offset(24);
        
        make.width.equalTo(325 * SCALE_6S_WIDTH);
        
        make.centerX.equalTo(self.contentView);
        
        make.bottom.equalTo(self.contentView).offset(-120);
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
    
    return cell;
}







@end
