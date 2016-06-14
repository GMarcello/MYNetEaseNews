//
//  HMNavigationController.m
//  我的网易新闻
//
//  Created by Marcello on 16/6/14.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import "HMNavigationController.h"
#import "HMHeadLineController.h"
#import "HMMainViewController.h"


@interface HMNavigationController ()

@end

@implementation HMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    HMMainViewController *main = [[HMMainViewController alloc] init];
    
    main.view.frame = self.view.bounds;
    
    [self addChildViewController:main];
    
    [self.view addSubview:main.view];
    
}




@end
