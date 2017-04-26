//
//  ReccomendViewModel.m
//  OC_Live
//
//  Created by MartinLee on 17/4/12.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "ReccomendViewModel.h"
#import "AnchorModel.h"
#import "AnchorGroup.h"

@interface ReccomendViewModel ()

@property (nonatomic,strong) AnchorGroup *bigDataGroup;
@property (nonatomic,strong) AnchorGroup *prettyGroup;
@end

@implementation ReccomendViewModel

- (NSMutableArray *)anchorGroups{
    if(_anchorGroups == nil){
        _anchorGroups = [[NSMutableArray alloc] init];
    }
    return _anchorGroups;
}

- (AnchorGroup *)bigDataGroup{
    if(_bigDataGroup == nil){
        _bigDataGroup = [[AnchorGroup alloc] init];
    }
    return _bigDataGroup;
}

- (AnchorGroup *)prettyGroup{
    if(_prettyGroup == nil){
        _prettyGroup = [[AnchorGroup alloc] init];
    }
    return _prettyGroup;
}

- (void)requestData:(void (^)())finishCallBack{
//    NSDate *current = [NSDate date];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@4,@"limit",@0,@"offset",[NSDate date],@"time", nil];

    //请求第一部分数据，推荐数据
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    [NetWorkTools requestData:GET URLString:@"http://capi.douyucdn.cn/api/v1/getbigDataRoom" parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"time",[NSDate date], nil] result:^(NSObject *obj) {
        NSDictionary *resultDictionary = (NSDictionary *)obj;
        if(resultDictionary){
            NSArray *dataArray = resultDictionary[@"data"];
            if(dataArray){
                self.bigDataGroup.tag_name = @"热门";
                self.bigDataGroup.icon_name = @"home_header_hot";
                for (NSDictionary *dic in dataArray) {
                    AnchorModel *model = [[AnchorModel alloc] initWithDictionary:dic];
                    [self.bigDataGroup.anchors addObject:model];
                }
            }else{
                return ;
            }
        }else{
            return ;
        }
        dispatch_group_leave(group);
    }];
    
    //请求颜值部分的数据
    dispatch_group_enter(group);
    [NetWorkTools requestData:GET URLString:@"http://capi.douyucdn.cn/api/v1/getVerticalRoom" parameters:parameters result:^(NSObject *obj) {
        NSDictionary *resultDictionary = (NSDictionary *)obj;
        if(resultDictionary){
            NSArray *dataArray = resultDictionary[@"data"];
            if(dataArray){
                self.prettyGroup.tag_name = @"颜值";
                self.prettyGroup.icon_name = @"home_header_phone";
                for (NSDictionary *dic in dataArray) {
                    AnchorModel *model = [[AnchorModel alloc] initWithDictionary:dic];
                    [self.prettyGroup.anchors addObject:model];
                }
            }else{
                return ;
            }
        }else{
            return ;
        }
        dispatch_group_leave(group);
    }];
    
    //请求游戏部分的数据
    dispatch_group_enter(group);
    [NetWorkTools requestData:GET URLString:@"http://capi.douyucdn.cn/api/v1/getHotCate" parameters:parameters result:^(NSObject *obj) {
        NSDictionary *resultDictionary = (NSDictionary *)obj;
        if(resultDictionary){
            NSArray *dataArray = resultDictionary[@"data"];
            if(dataArray){
                for (NSDictionary *dic in dataArray) {
                    AnchorGroup *model = [[AnchorGroup alloc] initWithDictionary:dic];
                    [self.anchorGroups addObject:model];
                }
            }else{
                return ;
            }
        }else{
            return ;
        }
        dispatch_group_leave(group);
    }];
    
    //所有数据都请求到之后进行排序
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [self.anchorGroups insertObject:self.prettyGroup atIndex:0];
        [self.anchorGroups insertObject:self.bigDataGroup atIndex:0];
        finishCallBack();
    });
    
}
@end
