//
//  NetWorkTools.m
//  OC_Live
//
//  Created by MartinLee on 17/4/12.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "NetWorkTools.h"

@implementation NetWorkTools

+ (void)requestData:(MethodType)type URLString:(NSString *)url parameters:(NSDictionary *)dictionary result:(void(^)(NSObject *obj))compelete{
    //int method = type == GET ? HTTPM
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if(type == GET){
        [manager GET:url parameters:dictionary progress:^(NSProgress * _Nonnull downloadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            compelete(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"GET请求失败");
        }];
    }else{
        [manager POST:url parameters:dictionary progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            compelete(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"POST请求失败");
        }];
    }
}
@end
