//
//  AnchorModel.m
//  OC_Live
//
//  Created by MartinLee on 17/4/12.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "AnchorModel.h"

@implementation AnchorModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    [self setValuesForKeysWithDictionary:dictionary];
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    //NSLog(@"AnchorModel UndefinedKey = %@",key);
}
@end
