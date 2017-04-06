//
//  CollectionNormalViewCell.m
//  OC_Live
//
//  Created by MartinLee on 17/4/6.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "CollectionNormalViewCell.h"

@interface CollectionNormalViewCell ()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *roomName;
@property (nonatomic,strong) UIImageView *idImageView;
@property (nonatomic,strong) UILabel *idNameLabel;
@property (nonatomic,strong) UIButton *customersNumber;


@end

@implementation CollectionNormalViewCell{
    UIView *_superView;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self updataUI];
}
- (void)updataUI{
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _superView = self.contentView;
    [self setUpImageView];
    [self setUpRoomName];
    [self setUpCustomersNumber];
    [self setUpIdImageView];
}

- (void)setUpImageView{
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    self.imageView.layer.cornerRadius = 5.0;
    self.imageView.layer.masksToBounds = true;
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.contentView);
        make.edges.mas_equalTo(_superView).insets(UIEdgeInsetsMake(0, 0, 15, 0));
    }];
}

- (void)setUpRoomName{
    self.roomName = [[UILabel alloc] init];
    self.roomName.text = @"斗鱼直播";
    [self.roomName sizeToFit];
    [self.contentView addSubview:self.roomName];
    
    [self.roomName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageView).offset(5);
        make.bottom.equalTo(_imageView).offset(-5);
    }];
}

- (void)setUpCustomersNumber{
    self.customersNumber = [[UIButton alloc] init];
    [self.customersNumber setImage:[UIImage imageNamed:@"Image_online"] forState:UIControlStateNormal];
    [self.customersNumber setTitle:@"6666" forState:UIControlStateNormal];
    [self.customersNumber setUserInteractionEnabled:false];
    [self.customersNumber sizeToFit];
    [self.contentView addSubview:self.customersNumber];
    
    [self.customersNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_imageView).offset(-5);
        make.bottom.equalTo(_imageView).offset(-5);
    }];
}

- (void)setUpIdImageView{
    self.idImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_live_cate_normal"]];
    [self.contentView addSubview:self.idImageView];
    
    [self.idImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.left.equalTo(_superView).offset(2);
    }];
}

@end
