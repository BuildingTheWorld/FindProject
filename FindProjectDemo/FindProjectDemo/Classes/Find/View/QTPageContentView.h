//
//  QTPageContentView.h
//  FindProjectDemo
//
//  Created by I on 2017/5/5.
//  Copyright © 2017年 QT. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface QTPageContentView : UIView

- (instancetype)initWithFrame:(CGRect)frame childVcArray:(NSArray *)childVcArray parentViewController:(UIViewController *)parentController;

@end
