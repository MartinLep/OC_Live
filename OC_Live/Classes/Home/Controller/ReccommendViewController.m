//
//  ReccommendViewController.m
//  OC_Live
//
//  Created by MartinLee on 17/4/6.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "AnchorGroup.h"
#import "ReccomendViewModel.h"
#import "CollectionHeraderView.h"
#import "ReccommendViewController.h"
#import "CollectionNormalViewCell.h"
#import "CollectionPrettyViewCell.h"
static NSString *NormalCellID = @"NormalCellID";
static NSString *PrettyCellID = @"PrettyCellID";
static NSString *HeaderViewID = @"HeaderViewID";

@interface ReccommendViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,assign) CGFloat ItemMargin;
@property (nonatomic,assign) CGFloat ItemW;
@property (nonatomic,assign) CGFloat NormalItemH;
@property (nonatomic,assign) CGFloat PrettyItemH;
@property (nonatomic,assign) CGFloat HeaderViewH;
@property (nonatomic,strong) ReccomendViewModel *ViewModel;


@property (nonatomic,strong)UICollectionView *collection;
@end

@implementation ReccommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _ItemMargin = 10;
    _ItemW = (ScreenW - 3*_ItemMargin)/2;
    _NormalItemH = 3*_ItemW/4;
    _PrettyItemH = 4*_ItemW/3;
    _HeaderViewH = 50;
    
    [self setUpUI];
    
    [self loadData];
}

- (void)setUpUI{
    [self.view addSubview:self.collection];
}

- (void)loadData{
    [self.ViewModel requestData:^{
        [self.collection reloadData];
    }];
}

- (UICollectionView *)collection{
    if(_collection == nil){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(_ItemW, _NormalItemH);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = _ItemMargin;
        layout.headerReferenceSize = CGSizeMake(ScreenW, _HeaderViewH);
        layout.sectionInset = UIEdgeInsetsMake(0, _ItemMargin, 0, _ItemMargin);
        
        _collection = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collection.delegate = self;
        _collection.dataSource = self;
        _collection.backgroundColor = [UIColor whiteColor];
        [_collection registerClass:[CollectionNormalViewCell class] forCellWithReuseIdentifier:NormalCellID];
        [_collection registerClass:[CollectionPrettyViewCell class] forCellWithReuseIdentifier:PrettyCellID];
        [_collection registerNib:[UINib nibWithNibName:@"CollectionHeraderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderViewID];
        
        _collection.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    }
    return _collection;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    AnchorGroup *group = self.ViewModel.anchorGroups[section];
    return group.anchors.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.ViewModel.anchorGroups.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AnchorGroup *group = self.ViewModel.anchorGroups[indexPath.section];
    AnchorModel *model = group.anchors[indexPath.item];
    if(indexPath.section == 1){
        CollectionPrettyViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PrettyCellID forIndexPath:indexPath];
        [cell setUpSubViews];
        cell.model = model;
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }else{
        CollectionNormalViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NormalCellID forIndexPath:indexPath];
        [cell initUI];
        cell.model = model;
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 1){
        return CGSizeMake(_ItemW, _PrettyItemH);
    }else{
       return CGSizeMake(_ItemW,_NormalItemH);
    }
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    CollectionHeraderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:HeaderViewID forIndexPath:indexPath];
    AnchorGroup *group = self.ViewModel.anchorGroups[indexPath.section];
    headerView.anchor = group;
    return headerView;
}

- (ReccomendViewModel *)ViewModel{
    if(_ViewModel == nil){
        _ViewModel = [[ReccomendViewModel alloc] init];
    }
    return _ViewModel;
}
@end

























