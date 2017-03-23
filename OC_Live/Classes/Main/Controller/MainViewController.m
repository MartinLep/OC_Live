//
//  MainViewController.m
//  OC_Live
//
//  Created by MartinLee on 17/3/23.
//  Copyright © 2017年 MartinLee. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addViewControllerWithName:@"Home"];
    [self addViewControllerWithName:@"Live"];
    [self addViewControllerWithName:@"Follow"];
    [self addViewControllerWithName:@"Profile"];
}

- (void)addViewControllerWithName:(NSString *)viewName{
    UIViewController *vc = [UIStoryboard storyboardWithName:viewName bundle:[NSBundle mainBundle]].instantiateInitialViewController;
    [self addChildViewController:vc];
}

@end
