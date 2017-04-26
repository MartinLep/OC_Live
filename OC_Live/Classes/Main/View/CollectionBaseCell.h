//
//  CollectionBaseCell.h
//  OC_Live
//
//  Created by MartinLee on 17/4/12.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnchorModel.h"
@interface CollectionBaseCell : UICollectionViewCell

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIButton *customersNumber;
@property (nonatomic,strong) UILabel *nickNameLabel; //房间名称

@property (nonatomic,strong) AnchorModel *model;

@end
