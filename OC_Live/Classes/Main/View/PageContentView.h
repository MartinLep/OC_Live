//
//  PageContentView.h
//  OC_Live
//
//  Created by MartinLee on 17/3/31.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PageContentView;
@protocol PageContentViewDelegate <NSObject>

- (void)pageContentView:(PageContentView *)contentView progress:(CGFloat)progress sourceIndex:(NSInteger)source targerIndex:(NSInteger) target;

@end

@interface PageContentView : UIView

@property (nonatomic,weak)id<PageContentViewDelegate> delegate;

- (void)setCurrentIndex:(NSInteger)index;
- (instancetype)initWithFrame:(CGRect)frame childViewControlles:(NSArray *)childViewControllers parentViewController:(UIViewController *)parent;

@end
