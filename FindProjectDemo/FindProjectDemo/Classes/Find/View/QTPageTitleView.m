//
//  QTPageTitleView.m
//  FindProjectDemo
//
//  Created by I on 2017/5/5.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTPageTitleView.h"

CGFloat kScrollLineH = 4;

@interface QTPageTitleView ()

// 存储属性

@property (strong, nonatomic)NSArray *titleArray;

@property (assign, nonatomic)NSInteger currentIndex;

// 懒加载属性

@property (strong, nonatomic) NSMutableArray *titleLabelArray;

@property (strong, nonatomic) UIView *scrollLine;

@end


@implementation QTPageTitleView

#pragma mark - 自定义构造方法

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles
{
    if (self = [super initWithFrame:frame])
    {
        self.titleArray = titles;
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self setUpSubViews];
    }
    
    return self;
}

#pragma mark - 懒加载

- (NSMutableArray *)titleLabelArray
{
    if (_titleLabelArray == nil) {
        _titleLabelArray = [NSMutableArray array];
    }
    
    return _titleLabelArray;
}

- (UIView *)scrollLine
{
    if (_scrollLine == nil) {
        _scrollLine = [[UIView alloc] init];
        
        _scrollLine.backgroundColor = [UIColor colorWithHexValue:0x7FD49B alpha:1];
        
        
        
        
        
//        _scrollLine.frame = CGRectMake(70 * SCALE_6S_WIDTH, self.frame.size.height - kScrollLineH * SCALE_6S_HEIGHT, 46 * SCALE_6S_WIDTH, kScrollLineH * SCALE_6S_HEIGHT);
    }
    
    return _scrollLine;
}

#pragma 添加子控件

- (void)setUpSubViews
{
    [self setupTitleLabels];
    
    [self setupBottomLine];
    
}


- (void)setupTitleLabels
{
    CGFloat labelW = self.frame.size.width / _titleArray.count;
    CGFloat labelH = self.frame.size.height - kScrollLineH * SCALE_6S_HEIGHT;
    CGFloat labelY = 0;
    
    
    for (int i = 0; i < self.titleArray.count; i++)
    {
        
        UILabel *label = [[UILabel alloc] init];
        
        label.text = self.titleArray[i];
        
        label.tag = i;
        
        label.font = [UIFont systemFontOfSize:13];
        
        
        
        label.textColor = [UIColor colorWithHexValue:0x3E3E3E alpha:1];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        
        CGFloat labelX = labelW * i;
        
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        [self addSubview:label];
        
        [self.titleLabelArray addObject:label];
        
        label.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleLabelClick:)];
        
        [label addGestureRecognizer:tapGes];
        
        
        if (i == 0)
        {
            label.textColor = [UIColor colorWithHexValue:0x00AF43 alpha:1];
            
            // 添加下划线
            
            UIView *scrollLineView = self.scrollLine;
            
            scrollLineView.qt_width = 46 * SCALE_6S_WIDTH;
            
            scrollLineView.qt_height = 4 * SCALE_6S_HEIGHT;
            
            scrollLineView.qt_centerX = label.qt_centerX;
            
            scrollLineView.qt_y = self.qt_height - scrollLineView.qt_height;
            
            [self addSubview:scrollLineView];
            
        }
    }
}


- (void)setupBottomLine
{
    // 底线
    
    UIView *bottomLine = [[UIView alloc] init];
    
    bottomLine.backgroundColor = [UIColor colorWithHexValue:0x69AE80 alpha:1];
    
    bottomLine.frame = CGRectMake(0, self.frame.size.height - 0.5 * SCALE_6S_HEIGHT, SCREEN_WIDTH, 0.5 * SCALE_6S_HEIGHT);
    
    [self addSubview:bottomLine];
    
}

- (void)titleLabelClick:(UITapGestureRecognizer *)tapGes
{
    // 6.通知代理
    
//    delegate?.pageTitleView(self, selectedIndex: currentIndex)

    UILabel *currentLabel = (UILabel *)tapGes.view;
    
    if (currentLabel.tag == self.currentIndex)
    {
        return;
    }
    
    UILabel *oldLabel = self.titleLabelArray[self.currentIndex];
    
    currentLabel.textColor = [UIColor colorWithHexValue:0x00AF43 alpha:1];
    
    oldLabel.textColor = [UIColor colorWithHexValue:0x3E3E3E alpha:1];
    
    self.currentIndex = currentLabel.tag;
    
    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.scrollLine.qt_centerX = currentLabel.qt_centerX;
        
    }];
    
}


@end
