//
//  QTPageTitleView.m
//  FindProjectDemo
//
//  Created by I on 2017/5/5.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTPageTitleView.h"


@interface QTPageTitleView ()

@property (strong, nonatomic)NSArray *titleArray;

@end


@implementation QTPageTitleView

#pragma mark - 自定义构造方法

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles
{
    if (self = [super initWithFrame:frame])
    {
        self.titleArray = titles;
    }
    
    return self;
}

@end
