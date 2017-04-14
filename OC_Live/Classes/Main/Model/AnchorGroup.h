//
//  AnchorGroup.h
//  OC_Live
//
//  Created by MartinLee on 17/4/12.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnchorGroup : NSObject

@property (nonatomic,strong) NSMutableArray *room_list;//改组中对应的房间信息
@property (nonatomic,strong) NSString *tag_name;//组显示的标题
@property (nonatomic,strong) NSString *icon_name;//组显示的图标
@property (nonatomic,strong) NSMutableArray *anchors;//主播的模型对象数组

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
