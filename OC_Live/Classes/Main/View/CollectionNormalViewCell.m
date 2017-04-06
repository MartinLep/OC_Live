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


- (void)initUI{
    [self updataUI];
}
- (void)updataUI{
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _superView = self.contentView;
    [self setUpImageView];
    [self setUpRoomName];
    [self setUpCustomersNumber];
    [self setUpIdImageView];
    [self setUpIdNameLabel];
}

- (void)setUpImageView{
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Img_default"]];
    self.imageView.layer.cornerRadius = 5.0;
    self.imageView.layer.masksToBounds = true;
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(_superView);
        make.top.equalTo(_superView);
        make.bottom.equalTo(_superView).offset(-20);
    }];
}

- (void)setUpRoomName{
    self.roomName = [[UILabel alloc] init];
    self.roomName.text = @"斗鱼直播";
    self.roomName.font = [UIFont systemFontOfSize:11];
    self.roomName.textColor = [UIColor whiteColor];
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
    self.customersNumber.titleLabel.font = [UIFont systemFontOfSize:11];
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
        make.bottom.equalTo(_superView).offset(-2);
    }];
}

- (void)setUpIdNameLabel{
    self.idNameLabel = [[UILabel alloc] init];
    self.idNameLabel.text = @"MartinLee的直播秀";
    self.idNameLabel.font = [UIFont systemFontOfSize:10];
    self.idNameLabel.textColor = [UIColor lightGrayColor];
    [self.idNameLabel sizeToFit];
    [self.contentView addSubview:self.idNameLabel];
    
    [self.idNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_idImageView.mas_right).offset(5);
        make.centerY.equalTo(_idImageView);
    }];
}

@end