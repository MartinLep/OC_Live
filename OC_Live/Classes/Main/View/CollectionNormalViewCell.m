//
//  CollectionNormalViewCell.m
//  OC_Live
//
//  Created by MartinLee on 17/4/6.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "CollectionNormalViewCell.h"

@interface CollectionNormalViewCell ()

@property (nonatomic,strong) UILabel *roomName;
@property (nonatomic,strong) UIImageView *idImageView;


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
    [self setUpCustomersNumber];
    [self setUpIdImageView];
    [self setUpRoomName];
    [self setUpIdNameLabel];
}

- (void)setUpImageView{
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Img_default"]];
    self.imageView.layer.cornerRadius = 5.0;
    self.imageView.layer.masksToBounds = true;
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.top.equalTo(_superView);
        make.bottom.equalTo(_superView).offset(-20);
    }];
}

- (void)setUpRoomName{
    self.roomName = [[UILabel alloc] init];
    self.roomName.font = [UIFont systemFontOfSize:11];
    self.roomName.textColor = [UIColor blackColor];
    [self.roomName sizeToFit];
    [self.contentView addSubview:self.roomName];
    
    [self.roomName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_idImageView.mas_right).offset(5);
        make.right.equalTo(self.contentView).offset(-5);
        make.centerY.equalTo(_idImageView);
    }];
}

- (void)setUpCustomersNumber{
    self.customersNumber = [[UIButton alloc] init];
    [self.customersNumber setImage:[UIImage imageNamed:@"Image_online"] forState:UIControlStateNormal];
    self.customersNumber.titleLabel.font = [UIFont systemFontOfSize:11];
    [self.customersNumber setUserInteractionEnabled:false];
    [self.customersNumber sizeToFit];
    [self.contentView addSubview:self.customersNumber];
    
    [self.customersNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.imageView).offset(-5);
        make.bottom.equalTo(self.imageView).offset(-5);
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
    self.nickNameLabel = [[UILabel alloc] init];
    self.nickNameLabel.font = [UIFont systemFontOfSize:10];
    self.nickNameLabel.textColor = [UIColor whiteColor];
    [self.nickNameLabel sizeToFit];
    [self.contentView addSubview:self.nickNameLabel];
    
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView).offset(5);
        make.bottom.equalTo(self.imageView).offset(-5);
    }];
}

- (void)setModel:(AnchorModel *)model{
    [super setModel:model];
    _roomName.text = model.room_name;
}

@end
