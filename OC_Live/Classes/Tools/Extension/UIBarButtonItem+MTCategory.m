//
//  UIBarButtonItem+MTCategory.m
//  OC_Live
//
//  Created by MartinLee on 17/3/23.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "UIBarButtonItem+MTCategory.h"

@implementation UIBarButtonItem (MTCategory)

+ (instancetype)initWithImage:(NSString *)image highImage:(NSString *)hImage size:(CGSize)size{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    if(hImage){
        [btn setImage:[UIImage imageNamed:hImage] forState:UIControlStateSelected];
    }
    if(CGSizeEqualToSize(size, CGSizeZero)){
        [btn sizeToFit];
    }else{
        btn.frame = CGRectMake(0, 0, size.width, size.height);
    }
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
