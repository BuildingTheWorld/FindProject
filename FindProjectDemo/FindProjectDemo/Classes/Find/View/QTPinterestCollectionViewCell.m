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

@property (strong, nonatomic) UIImageView *likeImageView;

@property (strong, nonatomic) UILabel *likeLabel;

@property (strong, nonatomic) UIImageView *PVImageView;

@property (strong, nonatomic) UILabel *PVLabel;

@property (strong, nonatomic) UIImageView *commentImageView;

@property (strong, nonatomic) UILabel *commentLabel;

@property (strong, nonatomic) UILabel *moreLabel;

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

- (UIImageView *)likeImageView
{
    if (_likeImageView == nil) {
        _likeImageView = [[UIImageView alloc] init];
        _likeImageView.image = [UIImage imageNamed:@"likeCount"];
    }
    
    return _likeImageView;
}

- (UILabel *)likeLabel
{
    if (_likeLabel == nil) {
        _likeLabel = [[UILabel alloc] init];
        _likeLabel.font = [UIFont systemFontOfSize:11];
        _likeLabel.textColor = [UIColor colorWithHexValue:0x949494 alpha:1];
        _likeLabel.text = @"23";
    }
    
    return _likeLabel;
}

- (UIImageView *)PVImageView
{
    if (_PVImageView == nil) {
        _PVImageView = [[UIImageView alloc] init];
        _PVImageView.image = [UIImage imageNamed:@"eye"];
    }
    
    return _PVImageView;
}

- (UILabel *)PVLabel
{
    if (_PVLabel == nil) {
        _PVLabel = [[UILabel alloc] init];
        _PVLabel.font = [UIFont systemFontOfSize:11];
        _PVLabel.textColor = [UIColor colorWithHexValue:0x949494 alpha:1];
        
        _PVLabel.text = @"33";
    }
    
    return _PVLabel;
}

- (UIImageView *)commentImageView
{
    if (_commentImageView == nil) {
        _commentImageView = [[UIImageView alloc] init];
        _commentImageView.image = [UIImage imageNamed:@"commentCount"];
    }
    
    return _commentImageView;
}

- (UILabel *)commentLabel
{
    if (_commentLabel == nil) {
        _commentLabel = [[UILabel alloc] init];
        _commentLabel.font = [UIFont systemFontOfSize:11];
        _commentLabel.textColor = [UIColor colorWithHexValue:0x949494 alpha:1];
        
        _commentLabel.text = @"12";
    }
    
    return _commentLabel;
}

- (UILabel *)moreLabel
{
    if (_moreLabel == nil) {
        _moreLabel = [[UILabel alloc] init];
        _moreLabel.font = [UIFont systemFontOfSize:12];
        _moreLabel.textColor = [UIColor colorWithHexValue:0xB5B5B5 alpha:1];
        _moreLabel.text = @"查看更多 >";
    }
    
    return _moreLabel;
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
        
        // likeImageView
        [self.contentView addSubview:self.likeImageView];
        
        // likeLabel
        [self.contentView addSubview:self.likeLabel];
        
        // PVImageView
        [self.contentView addSubview:self.PVImageView];
        
        // PVLabel
        [self.contentView addSubview:self.PVLabel];
        
        // commentImageView
        [self.contentView addSubview:self.commentImageView];
        
        // commentLabel
        [self.contentView addSubview:self.commentLabel];
        
        // moreLabel
        [self.contentView addSubview:self.moreLabel];
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
       
        
        make.width.equalTo(325 * SCALE_6S_WIDTH);
    
        make.top.equalTo(self.iconImageView.bottom).offset(24);
        
        make.centerX.equalTo(self.contentView);
        
//        make.bottom.equalTo(self.contentView).offset(-120);
    }];
    
    [self.likeImageView makeConstraints:^(MASConstraintMaker *make) {
       
        
        make.width.offset(14);
        
        make.height.offset(12);
        
        
        make.top.equalTo(self.abstractLabel.bottom).offset(40);
        
        make.left.equalTo(self.contentView).offset(22);
        
        make.bottom.equalTo(self.contentView).offset(-25);
        
    }];
    
    [self.likeLabel makeConstraints:^(MASConstraintMaker *make) {
    
        
        make.left.equalTo(self.likeImageView.right).offset(4);
        
        make.centerY.equalTo(self.likeImageView.centerY);
        
    }];
    
    [self.PVImageView makeConstraints:^(MASConstraintMaker *make) {
       
        
        make.width.offset(18);
        
        make.height.offset(12);
        
        make.left.equalTo(self.likeLabel.right).offset(4);
        
        make.centerY.equalTo(self.likeImageView.centerY);
        
    }];
    
    [self.PVLabel makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.left.equalTo(self.PVImageView.right).offset(4);
        
        make.centerY.equalTo(self.likeImageView.centerY);
        
    }];
    
    [self.commentImageView makeConstraints:^(MASConstraintMaker *make) {
       
        
        make.width.offset(14);
        
        make.height.offset(12);
        
        make.left.equalTo(self.PVLabel.right).offset(4);
        
        make.centerY.equalTo(self.likeImageView.centerY);
        
    }];
    
    [self.commentLabel makeConstraints:^(MASConstraintMaker *make) {
       
        
        make.left.equalTo(self.commentImageView.right).offset(4);
        
        make.centerY.equalTo(self.likeImageView.centerY);
    }];
    
    [self.moreLabel makeConstraints:^(MASConstraintMaker *make) {
       
        
        make.centerY.equalTo(self.likeImageView.centerY);
        
        make.right.equalTo(self.contentView).offset(-22);
        
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