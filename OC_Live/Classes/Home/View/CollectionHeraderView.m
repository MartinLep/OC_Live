//
//  CollectionHeraderView.m
//  OC_Live
//
//  Created by MartinLee on 17/4/6.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "CollectionHeraderView.h"

@interface CollectionHeraderView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation CollectionHeraderView

- (void)setAnchor:(AnchorGroup *)anchor{
    self.iconImageView.image = [UIImage imageNamed:anchor.icon_name];
    self.titleLabel.text = anchor.tag_name;
}

@end
