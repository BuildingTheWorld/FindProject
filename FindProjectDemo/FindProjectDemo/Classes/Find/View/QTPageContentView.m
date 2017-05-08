//
//  QTPageContentView.m
//  FindProjectDemo
//
//  Created by I on 2017/5/5.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTPageContentView.h"

@interface QTPageContentView ()

@property (strong, nonatomic) NSArray *childVcArray;

@property (weak, nonatomic) UIViewController *parentVc;

@end

@implementation QTPageContentView

#pragma mark - 自定义构造方法

- (instancetype)initWithFrame:(CGRect)frame childVcArray:(NSArray *)childVcArray parentViewController:(UIViewController *)parentController
{
    if (self = [super initWithFrame:frame])
    {
        self.childVcArray = childVcArray;
        self.parentVc = parentController;
    }
    
    return self;
}

@end
