//
//  AnchorGroup.m
//  OC_Live
//
//  Created by MartinLee on 17/4/12.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "AnchorGroup.h"
#import "AnchorModel.h"

@implementation AnchorGroup

- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    _room_list = [[NSMutableArray alloc] init];
    _icon_name = @"home_header_normal";
    [self setValuesForKeysWithDictionary:dictionary];
    return self;
}

- (void)setRoom_list:(NSMutableArray *)room_list{
    if(room_list){
        for (NSDictionary *dic in room_list) {
            [self.anchors addObject: [[AnchorModel alloc] initWithDictionary:dic]];
        }
    }
}

- (NSMutableArray *)anchors{
    if (_anchors == nil) {
        _anchors = [[NSMutableArray alloc] init];
    }
    return _anchors;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    //NSLog(@"UndefinedKey = %@",key);
}
@end
