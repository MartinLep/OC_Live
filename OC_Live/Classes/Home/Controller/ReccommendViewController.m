//
//  ReccommendViewController.m
//  OC_Live
//
//  Created by MartinLee on 17/4/6.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "ReccommendViewController.h"
#import "CollectionNormalViewCell.h"
static NSString *NormalCellID = @"NarmalCellId";
static NSString *PrettyCellID = @"PrettyCellID";

@interface ReccommendViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,assign) CGFloat ItemMargin;
@property (nonatomic,assign) CGFloat ItemW;
@property (nonatomic,assign) CGFloat NormalItemH;
@property (nonatomic,assign) CGFloat PrettyItemH;
@property (nonatomic,assign) CGFloat HeaderViewH;

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
}

- (void)setUpUI{
    [self.view addSubview:self.collection];
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
    }
    return _collection;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section == 0){
        return 8;
    }else{
        return 4;
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionNormalViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NormalCellID forIndexPath:indexPath];
    [cell initUI];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(_ItemW,_NormalItemH);
}
@end

























