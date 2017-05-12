//
//  QTTopCollectionViewCell.m
//  FindProjectDemo
//
//  Created by I on 2017/5/12.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTTopCollectionViewCell.h"

@interface QTTopCollectionViewCell ()

@property (strong, nonatomic) UIImageView *topImageView;

@end

@implementation QTTopCollectionViewCell

#pragma mark - lazy

- (UIImageView *)topImageView
{
    if (_topImageView == nil) {
        _topImageView = [[UIImageView alloc] init];
#warning model data
        _topImageView.image = [UIImage imageNamed:@"top_image"];
    }
    
    return _topImageView;
}

#pragma mark - override init

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.topImageView];
        
        [self.topImageView makeConstraints:^(MASConstraintMaker *make) {
           
            
            make.edges.equalTo(self.contentView);
            
        }];
    }
    
    return self;
}

@end
