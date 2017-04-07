//
//  CollectionPrettyViewCell.m
//  OC_Live
//
//  Created by MartinLee on 17/4/6.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "CollectionPrettyViewCell.h"

@interface CollectionPrettyViewCell ()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *customersNumber;
@property (nonatomic,strong) UILabel *roomLabel;
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
    self.imageView.layer.cornerRadius = 3;
    self.imageView.layer.masksToBounds = true;
    [self.contentView addSubview:self.imageView];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.width.equalTo(_superView);
        make.bottom.equalTo(_superView).offset(-50);
    }];
}

- (void)setUpCustomersNumber{
    self.customersNumber = [[UILabel alloc] init];
    self.customersNumber.text = @"6666在线";
    [self.customersNumber sizeToFit];
    self.customersNumber.font = [UIFont systemFontOfSize:12];
    self.customersNumber.textColor = [UIColor whiteColor];
    self.customersNumber.layer.cornerRadius = 5;
    self.customersNumber.layer.masksToBounds = true;
    self.customersNumber.backgroundColor = [UIColor colorWithDisplayP3Red:85/255.0 green:85/255.0 blue:85/255.0 alpha:0.8];
    [self.contentView addSubview:self.customersNumber];
    
    [_customersNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView).offset(5);
        make.right.equalTo(_imageView).offset(-5);
    }];
}

- (void)setUpRoomLabel{
    self.roomLabel = [[UILabel alloc] init];
    self.roomLabel.text = @"MartinLee ShowTime";
    self.roomLabel.textColor = [UIColor blackColor];
    self.roomLabel.font = [UIFont systemFontOfSize:12];
    self.roomLabel.backgroundColor = [UIColor clearColor];
    [self.roomLabel sizeToFit];
    [self.contentView addSubview:self.roomLabel];
    
    [_roomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView.mas_bottom).offset(5);
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
    self.locationLabel.text = @"MartinLee";
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

@end
