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
@property (nonatomic,assign) NSInteger currentIndex;

@end
@implementation PageTitleView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray{
    if(self = [super initWithFrame:frame]){
        self.titleArray = titleArray;
        _currentIndex = 0;
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
        [label setUserInteractionEnabled:true];
        [_scrollView addSubview:label];
        [self.mLabelsArray addObject:label];
        
        UITapGestureRecognizer *tap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGes:)];
        [label addGestureRecognizer:tap];
    }
}

- (void)tapGes:(UITapGestureRecognizer *)tapGes{
    UILabel *currentLabel = (UILabel *)tapGes.view;
    UILabel *oldLabel = _mLabelsArray[_currentIndex];
    
    //切换文字颜色
    oldLabel.textColor = [UIColor darkGrayColor];
    currentLabel.textColor = [UIColor orangeColor];
    
    _currentIndex = currentLabel.tag;
    
    //滚动条的位置发生改变
    CGFloat scrollLineX = _currentIndex * _scrollLine.frame.size.width;
    [UIView animateWithDuration:0.15 animations:^{
        CGRect frame = self.scrollLine.frame;
        CGRect newFrame = CGRectMake(scrollLineX, frame.origin.y, frame.size.width, frame.size.height);
        self.scrollLine.frame = newFrame;
    }];
    
    if(self.delegate){
        [_delegate pageTitleView:self selectedIndex:_currentIndex];
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

- (void)setTitleWithProgress:(CGFloat)progress sourceIndex:(NSInteger)source targetIndex:(NSInteger)target{
    UILabel *sourceLabel = _mLabelsArray[source];
    UILabel *targetLabel = _mLabelsArray[target];
    
    CGFloat NormalColor[3] = {85,85,85};
    CGFloat SelectColor[3] = {255,128,0};
    CGFloat colorData[3] = {SelectColor[0]-NormalColor[0],SelectColor[1]-NormalColor[1],SelectColor[2]-NormalColor[2]};
    //处理滑块
    CGFloat moveToX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x;
    CGFloat moveX = progress * moveToX;
    CGRect frame = _scrollLine.frame;
    _scrollLine.frame = CGRectMake(frame.origin.x+moveX, frame.origin.y, frame.size.width, frame.size.height);
    
    sourceLabel.textColor = [UIColor colorWithRed:SelectColor[0]-colorData[0]*progress green:SelectColor[1]-colorData[1]*progress blue:SelectColor[2]-colorData[2]*progress alpha:1.0];
    targetLabel.textColor = [UIColor colorWithRed:NormalColor[0]+colorData[0]*progress green:NormalColor[1]+colorData[1]*progress blue:NormalColor[2]+colorData[2]*progress alpha:1.0];
    
    _currentIndex = target;
}


@end
