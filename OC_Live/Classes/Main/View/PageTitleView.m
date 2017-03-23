//
//  PageTitleView.m
//  OC_Live
//
//  Created by MartinLee on 17/3/23.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "PageTitleView.h"

#define ScrollLineWith 2

@interface PageTitleView ()

@property (nonatomic,strong) NSMutableArray *mLabelsArray;
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView *scrollLine;

@end
@implementation PageTitleView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray{
    if(self = [super initWithFrame:frame]){
        self.titleArray = titleArray;
        [self setUpUI];
    }
    return self;
}

- (UIScrollView *)scrollView{
    if(_scrollView == nil){
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = false;
        _scrollView.scrollsToTop = false;
        _scrollView.pagingEnabled = false;
        _scrollView.bounces = false;
    }
    return _scrollView;
}

- (NSMutableArray *)mLabelsArray{
    if(_mLabelsArray == nil){
        _mLabelsArray = [NSMutableArray arrayWithCapacity:6];
    }
    return _mLabelsArray;
}

- (UIView *)scrollLine{
    if(_scrollLine == nil){
        _scrollLine = [[UIView alloc] init];
        _scrollLine.backgroundColor = [UIColor orangeColor];
    }
    return _scrollLine;
}

- (void)setUpUI{
    [self addSubview:self.scrollView];
    [self setUpTitleLabels];
    [self setUpButtomLineAndScrollLine];
}

- (void)setUpTitleLabels{
    //标题名称
    CGFloat labelW = self.frame.size.width/_titleArray.count;
    CGFloat labelH = self.frame.size.height - ScrollLineWith;
    CGFloat labelY = 0;
    for(int i = 0 ; i< _titleArray.count ; i ++ ){
        CGFloat labelX = labelW * i;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelW, labelH)];
        label.text = _titleArray[i];
        label.tag = i;
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = [UIColor darkGrayColor];
        label.textAlignment = NSTextAlignmentCenter;
        
        [_scrollView addSubview:label];
        [self.mLabelsArray addObject:label];
    }
}

- (void)setUpButtomLineAndScrollLine{
    //底下移动的滑块和滑块下面的线条
    CGFloat buttomLineH = 0.5;
    UIView *buttomLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - ScrollLineWith, self.frame.size.width, buttomLineH)];
    buttomLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:buttomLine];
    
    UILabel *firstLabel = [_mLabelsArray firstObject];
    [_scrollView addSubview:self.scrollLine];
    _scrollLine.frame = CGRectMake(firstLabel.frame.origin.x, self.frame.size.height - ScrollLineWith, firstLabel.frame.size.width, ScrollLineWith);
}


@end
