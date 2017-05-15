//
//  QTCommentCell.m
//  FindProjectDemo
//
//  Created by I on 2017/5/15.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTCommentCell.h"

@interface QTCommentCell ()

@property (strong, nonatomic) UIImageView *iconImageView;

@property (strong, nonatomic) UILabel *nameLabel;

@property (strong, nonatomic) UILabel *commentLabel;

@end

@implementation QTCommentCell

#pragma mark - lazy

- (UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
#warning TODO
        _iconImageView.image = [UIImage imageNamed:@"icon"];
    }
    
    return _iconImageView;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:12];
#warning TODO
        _nameLabel.text = @"Lisa小仙女";
    }
    
    return _nameLabel;
}

- (UILabel *)commentLabel
{
    if (_commentLabel == nil) {
        _commentLabel = [[UILabel alloc] init];
        _commentLabel.numberOfLines = 0;
        _commentLabel.font = [UIFont systemFontOfSize:11];
        _commentLabel.textColor = [UIColor colorWithHexValue:0x6A6767 alpha:1];
#warning TODO
        _commentLabel.text = @"超级棒棒棒,不得不点赞.超级棒棒棒,不得不点赞.超级棒棒棒";
    }
    
    return _commentLabel;
}

#pragma mark - init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
        self.contentView.backgroundColor = [UIColor cyanColor];
        
        
        // icon
        [self.contentView addSubview:self.iconImageView];
        
        [self.iconImageView makeConstraints:^(MASConstraintMaker *make) {
           
            
            make.width.offset(29);
            
            make.height.offset(29);
            
            make.top.equalTo(self.contentView).offset(15 * SCALE_6S_HEIGHT);
            
            make.left.equalTo(self.contentView).offset(22 *SCALE_6S_WIDTH);
            
        }];
        
        
        // name
        [self.contentView addSubview:self.nameLabel];
        
        [self.nameLabel makeConstraints:^(MASConstraintMaker *make) {
            
           
            make.top.equalTo(self.iconImageView.top);
            
            make.left.equalTo(self.iconImageView.right).offset(6 * SCALE_6S_WIDTH);
        }];
        
        
        // comment
        [self.contentView addSubview:self.commentLabel];
        
        [self.commentLabel makeConstraints:^(MASConstraintMaker *make) {
            
           
            make.left.equalTo(self.nameLabel.left);
            
            make.right.equalTo(self.contentView.right).offset(-22 * SCALE_6S_WIDTH);
            
            make.top.equalTo(self.nameLabel.bottom).offset(4);
            
            make.bottom.equalTo(self.contentView.bottom).offset(-15);
        }];
        
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
