//
//  QTPageContentView.h
//  FindProjectDemo
//
//  Created by I on 2017/5/5.
//  Copyright © 2017年 QT. All rights reserved.
//

#import <UIKit/UIKit.h>


@class QTPageContentView;

@protocol QTPageContentViewDelegate <NSObject>

- (void)pageContentView:(UIView *)pageContentView setTitleIndex:(NSInteger)index;

@end


@interface QTPageContentView : UIView

@property (weak, nonatomic) id <QTPageContentViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame childVcArray:(NSArray *)childVcArray parentViewController:(UIViewController *)parentController;

@end
