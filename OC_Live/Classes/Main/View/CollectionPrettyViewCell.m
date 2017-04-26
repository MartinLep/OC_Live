//
//  CollectionPrettyViewCell.m
//  OC_Live
//
//  Created by MartinLee on 17/4/6.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "CollectionPrettyViewCell.h"

@interface CollectionPrettyViewCell ()

@property (nonatomic,strong) UIImageView *locationImage;
@property (nonatomic,strong) UILabel *locationLabel;


@end

@implementation CollectionPrettyViewCell{
    UIView *_superView;
}

- (void)setUpSubViews{
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _superView = self.contentView;
    [self setUpImageView];
    [self setUpCustomersNumber];
    [self setUpRoomLabel];
    [self setLocationInformation];
}

- (void)setUpImageView{
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"live_cell_default_phone"]];
    self.imageView.layer.cornerRadius = 5;
    self.imageView.layer.masksToBounds = true;
    [self.contentView addSubview:self.imageView];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.width.equalTo(_superView);
        make.bottom.equalTo(_superView).offset(-50);
    }];
}

- (void)setUpCustomersNumber{
    self.customersNumber = [[UIButton alloc] init];
    [self.customersNumber sizeToFit];
    self.customersNumber.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.customersNumber setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.customersNumber.userInteractionEnabled = false;
    self.customersNumber.layer.cornerRadius = 2;
    self.customersNumber.layer.masksToBounds = true;
    self.customersNumber.backgroundColor = [UIColor colorWithDisplayP3Red:85/255.0 green:85/255.0 blue:85/255.0 alpha:0.8];
    [self.contentView addSubview:self.customersNumber];
    
    [self.customersNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView).offset(5);
        make.right.equalTo(self.imageView).offset(-5);
        make.height.mas_equalTo(20);
    }];
}

- (void)setUpRoomLabel{
    self.nickNameLabel = [[UILabel alloc] init];
    self.nickNameLabel.textColor = [UIColor blackColor];
    self.nickNameLabel.font = [UIFont systemFontOfSize:12];
    self.nickNameLabel.backgroundColor = [UIColor clearColor];
    [self.nickNameLabel sizeToFit];
    [self.contentView addSubview:self.nickNameLabel];
    
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(5);
        make.left.equalTo(_superView).offset(5);
    }];
}

- (void)setLocationInformation{
    self.locationImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_location"]];
    [self.contentView addSubview:self.locationImage];
    
    [_locationImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.left.equalTo(_superView).offset(5);
        make.bottom.equalTo(_superView).offset(-10);
    }];
    
    self.locationLabel = [[UILabel alloc] init];
    [self.locationLabel sizeToFit];
    self.locationLabel.textColor = [UIColor lightGrayColor];
    self.locationLabel.font = [UIFont systemFontOfSize:12];
    self.locationLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.locationLabel];
    
    [_locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_locationImage.mas_right);
        make.centerY.equalTo(_locationImage);
    }];
}

- (void)setModel:(AnchorModel *)model{
    [super setModel:model];
    _locationLabel.text = model.anchor_city;
}
@end
