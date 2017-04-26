//
//  NetWorkTools.h
//  OC_Live
//
//  Created by MartinLee on 17/4/12.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,MethodType) {
    GET,
    POST,
};

@interface NetWorkTools : NSObject

+ (void)requestData:(MethodType)type URLString:(NSString *)url parameters:(NSDictionary *)dictionary result:(void(^)(NSObject *obj))compelete;

@end
