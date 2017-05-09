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

//@property (strong, nonatomic) UIView *testView;

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
        
        
//        UIView *testView = [[UIView alloc] init];
//        
//        testView.backgroundColor = [UIColor redColor];
//        
//        self.testView = testView;
//        
//        [self.contentView addSubview:testView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.topImageView makeConstraints:^(MASConstraintMaker *make) {
        
//        make.left.right.equalTo(self);
        
        make.left.equalTo(self);
        
        make.top.equalTo(self);
        
        make.right.equalTo(self);
        
//        make.width.offset(375 * SCALE_6S_WIDTH);
        
        make.height.offset(213 * SCALE_6S_HEIGHT);
        
        make.bottom.equalTo(self).offset(120 * SCALE_6S_HEIGHT).priority(100);
        
    }];
    
    
//    [self.testView makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.left.top.equalTo(self).offset(30);
//        
//        make.bottom.right.equalTo(self).offset(-30);
//    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

@end
