//
//  HMHeadLineControllerViewController.m
//  我的网易新闻
//
//  Created by Marcello on 16/6/14.
//  Copyright © 2016年 Marcello. All rights reserved.

//

#import "HMHeadLineController.h"

@interface HMHeadLineController ()

@end

@implementation HMHeadLineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
