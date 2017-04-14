//
//  AnchorModel.h
//  OC_Live
//
//  Created by MartinLee on 17/4/12.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnchorModel : NSObject

@property (nonatomic,strong) NSString *room_id;
@property (nonatomic,strong) NSString *vertical_src; //房间图片对应的URL
@property (nonatomic,assign) int isVertical; //手机还是电脑(0-computer 1-phone)
@property (nonatomic,strong) NSString *room_name;
@property (nonatomic,copy) NSString *nickname;//主播昵称
@property (nonatomic,assign) int online;
@property (nonatomic,strong) NSString *anchor_city;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
