//
//  HomeViewController.m
//  OC_Live
//
//  Created by MartinLee on 17/3/23.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "UIBarButtonItem+MTCategory.h"
#import "HomeViewController.h"
#import "PageTitleView.h"
#import "CommonValue.h"

#define TitleHeight 40

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    [self setUpNavigationItems];
    [self setUpPageTitleView];
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

- (void)setUpPageTitleView{
    PageTitleView *titleView = [[PageTitleView alloc] initWithFrame:CGRectMake(0, StatusBarH+NavigationBarH , ScreenW, TitleHeight) titles:@[@"推荐",@"游戏",@"娱乐",@"趣玩"]];
    [self.view addSubview:titleView];
}

@end
