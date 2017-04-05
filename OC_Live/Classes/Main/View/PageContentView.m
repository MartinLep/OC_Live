//
//  PageContentView.m
//  OC_Live
//
//  Created by MartinLee on 17/3/31.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "PageContentView.h"

static NSString *collectionViewCell = @"CellIdentify";

@interface PageContentView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)NSArray *childControllersArray;
@property (nonatomic,strong)UIViewController *parentController;
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,assign)CGFloat startOffsetX;
@end

@implementation PageContentView

- (instancetype)initWithFrame:(CGRect)frame childViewControlles:(NSArray *)childViewControllers parentViewController:(UIViewController *)parent{
    if(self = [super initWithFrame:frame]){
        self.childControllersArray = childViewControllers;
        self.parentController = parent;
        _startOffsetX = 0;
        [self setUpUI];
    }
    return self;
}

- (NSArray *)childControllersArray{
    if(_childControllersArray == nil){
        _childControllersArray = [[NSArray alloc] init];
    }
    return _childControllersArray;
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = self.bounds.size;
        layout.minimumLineSpacing = 0;//行间距
        layout.minimumInteritemSpacing = 0;//item间距
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//水平滚动
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator = false;
        _collectionView.pagingEnabled = true;
        _collectionView.bounces = false;//不超出内容滚动区域
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collectionViewCell];
        
    }
    return _collectionView;
}

- (void)setUpUI{
    for (UIViewController *child in _childControllersArray) {
        [_parentController addChildViewController:child];
    }
    //添加UICollectionView,用于在cell中存放控制器的View
    [self addSubview:self.collectionView];
    _collectionView.frame = self.bounds;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _childControllersArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCell forIndexPath:indexPath];
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    UIViewController *child = _childControllersArray[indexPath.item];
    child.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:child.view];
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    _startOffsetX = scrollView.contentOffset.x;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat progress = 0;//滑动的进度
    int sourceIndex = 0;
    int targetIndex = 0;
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    CGFloat scrollViewW = scrollView.bounds.size.width;
    
    if(currentOffsetX > _startOffsetX){
        //左滑
        progress = (currentOffsetX - _startOffsetX)/scrollViewW;
        sourceIndex = (int)currentOffsetX/scrollViewW;
        targetIndex = sourceIndex + 1;
        
        if(targetIndex >= _childControllersArray.count){
            targetIndex = (int)_childControllersArray.count - 1;
        }
        
        if(currentOffsetX - _startOffsetX == scrollViewW){
            progress = 1;
            targetIndex = sourceIndex;
        }
    }else{
        //右滑
        progress = 1 - currentOffsetX/scrollViewW + (int)(currentOffsetX/scrollViewW);
        targetIndex = (int)(currentOffsetX/scrollViewW);
        sourceIndex = targetIndex + 1;
        if(sourceIndex >= _childControllersArray.count){
            sourceIndex = (int)_childControllersArray.count - 1;
        }
    }
    
    if(self.delegate){
        [_delegate pageContentView:self progress:progress sourceIndex:sourceIndex targerIndex:targetIndex];
    }
}

- (void)setCurrentIndex:(NSInteger)index{
    CGFloat offsetX = index * _collectionView.bounds.size.width;
//    [_collectionView setContentOffset:CGPointMake(offsetX, 0)];
    [_collectionView setContentOffset:CGPointMake(offsetX, 0) animated:true];
}

@end
