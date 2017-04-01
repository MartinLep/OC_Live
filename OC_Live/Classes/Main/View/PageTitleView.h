//
//  PageTitleView.h
//  OC_Live
//
//  Created by MartinLee on 17/3/23.
//  Copyright © 2017年 MartinLee. All rights reserved.
//
//标题文字及下面的滑条

#import <UIKit/UIKit.h>

@class PageTitleView;
@protocol PageTitleViewDelegate <NSObject>

- (void)pageTitleView:(PageTitleView *)titleView selectedIndex:(NSInteger)index;

@end

@interface PageTitleView : UIView

@property (nonatomic,weak) id<PageTitleViewDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray;
- (void)setTitleWithProgress:(CGFloat)progress sourceIndex:(NSInteger)source targetIndex:(NSInteger)target;
@end
