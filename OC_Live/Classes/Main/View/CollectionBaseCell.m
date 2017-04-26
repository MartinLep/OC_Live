//
//  CollectionBaseCell.m
//  OC_Live
//
//  Created by MartinLee on 17/4/12.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "CollectionBaseCell.h"

@implementation CollectionBaseCell


- (void)setModel:(AnchorModel *)model{
    //定义模型
    NSString *onLine;
    if(model.online >= 10000){
        onLine = [NSString stringWithFormat:@"%d 万人在线",(int)(model.online/10000)];
    }else{
        onLine = [NSString stringWithFormat:@"%d 人在线",model.online];
    }
    [_customersNumber setTitle:onLine forState:UIControlStateNormal];
    
    _nickNameLabel.text = model.nickname;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.vertical_src]];

}
@end
