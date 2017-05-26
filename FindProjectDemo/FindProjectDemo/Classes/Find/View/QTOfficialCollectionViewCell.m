//
//  QTOfficialCollectionViewCell.m
//  FindProjectDemo
//
//  Created by I on 2017/5/9.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTOfficialCollectionViewCell.h"

@interface QTOfficialCollectionViewCell ()

@property (strong, nonatomic) UIImageView *topImageView;

@end


@implementation QTOfficialCollectionViewCell

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        UIImageView *topImageView = [[UIImageView alloc] init];
        
        topImageView.image = [UIImage imageNamed:@"sample"];
        
        [self.contentView addSubview:topImageView];
        
        self.topImageView = topImageView;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.topImageView makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.contentView);
        
        make.left.equalTo(self.contentView);
        
        make.right.equalTo(self.contentView);
        
        make.bottom.equalTo(self.contentView).offset(150 * SCALE_6S_HEIGHT).priority(100);
        
        make.height.offset(213 * SCALE_6S_HEIGHT);
        
    }];
    
}


@end
