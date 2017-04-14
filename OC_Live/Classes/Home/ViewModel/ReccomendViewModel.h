//
//  ReccomendViewModel.h
//  OC_Live
//
//  Created by MartinLee on 17/4/12.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReccomendViewModel : NSObject

@property (nonatomic,strong)NSMutableArray *anchorGroups;


- (void)requestData:(void(^)())finishCallBack;
@end
