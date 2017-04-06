//
//  HomeViewController.m
//  OC_Live
//
//  Created by MartinLee on 17/3/23.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "UIBarButtonItem+MTCategory.h"
#import "ReccommendViewController.h"
#import "HomeViewController.h"
#import "PageContentView.h"
#import "PageTitleView.h"
#import "CommonValue.h"

#define TitleHeight 40

@interface HomeViewController ()<PageTitleViewDelegate,PageContentViewDelegate>

@property (nonatomic,strong)PageContentView *pageContentView;
@property (nonatomic,strong)PageTitleView *pageTitleView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    [self setUpNavigationItems];
    [self.view addSubview:self.pageTitleView];
    [self.view addSubview:self.pageContentView];
}

/**
 设置导航控制器
 */
- (void)setUpNavigationItems{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImage:@"logo" highImage:nil size:CGSizeZero];
    
    CGSize size = CGSizeMake(40, 40);
    UIBarButtonItem *historyItem = [UIBarButtonItem initWithImage:@"image_my_history" highImage:@"Image_my_history_click" size:size];
    UIBarButtonItem *searchItem = [UIBarButtonItem initWithImage:@"btn_search" highImage:@"btn_search_clicked" size:size];
    UIBarButtonItem *qrcodeItem = [UIBarButtonItem initWithImage:@"Image_scan" highImage:@"Image_scan_click" size:size];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:historyItem,searchItem,qrcodeItem, nil];
}

- (PageTitleView *)pageTitleView{
    if(_pageTitleView == nil){
        _pageTitleView = [[PageTitleView alloc] initWithFrame:CGRectMake(0, StatusBarH+NavigationBarH , ScreenW, TitleHeight) titles:@[@"推荐",@"游戏",@"娱乐",@"趣玩"]];
        _pageTitleView.delegate = self;
    }
    return _pageTitleView;
}



- (PageContentView *)pageContentView{
    if(_pageContentView == nil){
        CGFloat contentH = ScreenH - StatusBarH - NavigationBarH - TitleHeight;
        CGRect frame = CGRectMake(0, StatusBarH + NavigationBarH + TitleHeight, ScreenW, contentH);
        NSMutableArray *mArray = [[NSMutableArray alloc] init];
        NSArray *colorArray = [NSArray arrayWithObjects:[UIColor blueColor],[UIColor yellowColor],[UIColor whiteColor],[UIColor orangeColor], nil];
        ReccommendViewController *view = [[ReccommendViewController alloc] init];
        [mArray addObject:view];
        for (int i = 0; i < 3; i++) {
            UIViewController *viewController = [[UIViewController alloc] init];
            viewController.view.backgroundColor = colorArray[i];
            [mArray addObject:viewController];
        }
        _pageContentView = [[PageContentView alloc] initWithFrame:frame childViewControlles:[NSArray arrayWithArray:mArray] parentViewController:self];
        _pageContentView.delegate = self;
    }
    return _pageContentView;
}

- (void)pageTitleView:(PageTitleView *)titleView selectedIndex:(NSInteger)index{
    [_pageContentView setCurrentIndex:index];
}


- (void)pageContentView:(PageContentView *)contentView progress:(CGFloat)progress sourceIndex:(NSInteger)source targerIndex:(NSInteger)target{
    [_pageTitleView setTitleWithProgress:progress sourceIndex:source targetIndex:target];
}


@end
