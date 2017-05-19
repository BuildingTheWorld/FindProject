//
//  QTPinterestCollectionViewCell.m
//  FindProjectDemo
//
//  Created by I on 2017/5/10.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTPinterestCollectionViewCell.h"

#import "QTTopCycleView.h"

@interface QTPinterestCollectionViewCell ()

@property (strong, nonatomic) QTTopCycleView *topCycleView;

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

- (QTTopCycleView *)topCycleView
{
    if (_topCycleView == nil) {
        
        _topCycleView = [[QTTopCycleView alloc] init];
        
//        _topCycleView.userInteractionEnabled = NO;
    }
    
    return _topCycleView;
}

- (UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 20;
    }
    
    return _iconImageView;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        
        _nameLabel.text = @"lisa小仙女";
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
        
        _abstractLabel.numberOfLines = 0;
        
        
        
        NSString *textStr = @"夏天快到了,是不是又在纠结有那个防晒了? 今天要公布的就是各款人气防晒的排名啦";
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:textStr];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        
        paragraphStyle.lineSpacing = 10;
        
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedString.length)];
        
        _abstractLabel.attributedText = attributedString;
        
        _abstractLabel.font = [UIFont systemFontOfSize:15];

        
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
        
        
        
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        // topCycleView
        [self.contentView addSubview:self.topCycleView];
        [self.topCycleView makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.width.offset(SCREEN_WIDTH);
            
            make.height.offset(SCREEN_WIDTH);
            
            make.top.equalTo(self.contentView);
            
            make.left.equalTo(self.contentView);
            
        }];
        
        // icon
        [self.contentView addSubview:self.iconImageView];
        [self.iconImageView makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.top.equalTo(self.topCycleView.bottom).offset(24 * SCALE_6S_HEIGHT);
            
            make.left.equalTo(self.contentView).offset(24 * SCALE_6S_WIDTH);
            
            make.width.offset(40);
            
            make.height.offset(40);
            
        }];
        
        // name
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.left.equalTo(self.iconImageView.right).offset(6);
            
            make.top.equalTo(self.iconImageView);
            
        }];
        
        // time
        [self.contentView addSubview:self.timeLable];
        [self.timeLable makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.left.equalTo(self.iconImageView.right).offset(6);
            
            make.bottom.equalTo(self.iconImageView);
            
        }];
        
        // abstract
        [self.contentView addSubview:self.abstractLabel];
        [self.abstractLabel makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.width.equalTo(325 * SCALE_6S_WIDTH);
            
            make.top.equalTo(self.iconImageView.bottom).offset(24);
            
            make.centerX.equalTo(self.contentView);
            
            //        make.bottom.equalTo(self.contentView).offset(-120);
        }];
        
        // likeImageView
        [self.contentView addSubview:self.likeImageView];
        [self.likeImageView makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.width.offset(13);
            
            make.height.offset(11);
            
            make.top.equalTo(self.abstractLabel.bottom).offset(40);
            
            make.left.equalTo(self.contentView).offset(22);
            
            make.bottom.equalTo(self.contentView).offset(-25);
            
        }];
        
        // likeLabel
        [self.contentView addSubview:self.likeLabel];
        [self.likeLabel makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.left.equalTo(self.likeImageView.right).offset(4);
            
            make.centerY.equalTo(self.likeImageView.centerY);
            
        }];
        
        // PVImageView
        [self.contentView addSubview:self.PVImageView];
        [self.PVImageView makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.width.offset(15);
            
            make.height.offset(11);
            
            make.left.equalTo(self.likeLabel.right).offset(4);
            
            make.centerY.equalTo(self.likeImageView.centerY);
            
        }];
        
        // PVLabel
        [self.contentView addSubview:self.PVLabel];
        [self.PVLabel makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.left.equalTo(self.PVImageView.right).offset(4);
            
            make.centerY.equalTo(self.likeImageView.centerY);
            
        }];
        
        // commentImageView
        [self.contentView addSubview:self.commentImageView];
        [self.commentImageView makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.width.offset(13);
            
            make.height.offset(13);
            
            make.left.equalTo(self.PVLabel.right).offset(4);
            
            make.centerY.equalTo(self.likeImageView.centerY);
            
        }];
        
        // commentLabel
        [self.contentView addSubview:self.commentLabel];
        [self.commentLabel makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.left.equalTo(self.commentImageView.right).offset(4);
            
            make.centerY.equalTo(self.likeImageView.centerY);
        }];
        
        // moreLabel
        [self.contentView addSubview:self.moreLabel];
        [self.moreLabel makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.centerY.equalTo(self.likeImageView.centerY);
            
            make.right.equalTo(self.contentView).offset(-22);
            
        }];
        
    }
    
    return self;
}



@end
