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

    self.navigationBar.barTintColor = [UIColor yellowColor];

    self.navigationBar.translucent = NO;
    
    [self initWithRootViewController:main];
    
    [self.view addSubview:main.view];
    

}




@end
