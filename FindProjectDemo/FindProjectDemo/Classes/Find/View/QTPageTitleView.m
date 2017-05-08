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
        
        _scrollLine.frame = CGRectMake(70 * SCALE_6S_WIDTH, self.frame.size.height - kScrollLineH * SCALE_6S_HEIGHT, 46 * SCALE_6S_WIDTH, kScrollLineH * SCALE_6S_HEIGHT);
    }
    
    return _scrollLine;
}

#pragma 添加子控件

- (void)setUpSubViews
{
    [self setupTitleLabels];
    
    [self setupBottomLineAndScrollLine];
    
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
        
        if (i == 0)
        {
            label.textColor = [UIColor colorWithHexValue:0x00AF43 alpha:1];
        }
        
        label.textColor = [UIColor colorWithHexValue:0x3E3E3E alpha:1];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        
        CGFloat labelX = labelW * i;
        
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        [self addSubview:label];
        
        [self.titleLabelArray addObject:label];
        
        label.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleLabelClick:)];
        
        [label addGestureRecognizer:tapGes];
        
    }
}


- (void)setupBottomLineAndScrollLine
{
    
//    let bottomLine = UIView()
//    bottomLine.backgroundColor = UIColor.lightGray
//    let lineH : CGFloat = 0.5
//    bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
//    addSubview(bottomLine)
    
    // 底线
    
    UIView *bottomLine = [[UIView alloc] init];
    
    bottomLine.backgroundColor = [UIColor colorWithHexValue:0x69AE80 alpha:1];
    
    bottomLine.frame = CGRectMake(0, self.frame.size.height - 0.5 * SCALE_6S_HEIGHT, SCREEN_WIDTH, 0.5 * SCALE_6S_HEIGHT);
    
    [self addSubview:bottomLine];
    
    // 下划线
    
    [self addSubview:self.scrollLine];
    
    
}

- (void)titleLabelClick:(UITapGestureRecognizer *)tapGes
{
//    NSLog(@"----");
    
    
    // 0.获取当前Label
    
//    guard let currentLabel = tapGes.view as? UILabel else { return }
    
    // 1.如果是重复点击同一个Title,那么直接返回
    
//    if currentLabel.tag == currentIndex { return }
    
    // 2.获取之前的Label
    
//    let oldLabel = titleLabels[currentIndex]
    
    // 3.切换文字的颜色
    
//    currentLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
    
//    oldLabel.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
    
    // 4.保存最新Label的下标值
    
//    currentIndex = currentLabel.tag
    
    // 5.滚动条位置发生改变
    
//    let scrollLineX = CGFloat(currentIndex) * scrollLine.frame.width
    
//    UIView.animate(withDuration: 0.15, animations: {
    
//        self.scrollLine.frame.origin.x = scrollLineX
    
//    })
    
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
        
        if (self.currentIndex == 0)
        {
            self.scrollLine.frame = CGRectMake(70 * SCALE_6S_WIDTH, self.frame.size.height - kScrollLineH * SCALE_6S_HEIGHT, 46 * SCALE_6S_WIDTH, kScrollLineH * SCALE_6S_HEIGHT);
        }
        if (self.currentIndex == 1)
        {
            self.scrollLine.frame = CGRectMake(257 * SCALE_6S_WIDTH, self.frame.size.height - kScrollLineH *SCALE_6S_HEIGHT, 46 * SCALE_6S_WIDTH, kScrollLineH * SCALE_6S_HEIGHT);
        }
    }];
    
}


@end
