//
//  HMNetworkTool.m
//  我的网易新闻
//
//  Created by Marcello on 16/6/15.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import "HMNetworkTool.h"

@implementation HMNetworkTool

+ (instancetype)sharedNetworkTool {
    static HMNetworkTool *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        instance = [[self alloc] initWithBaseURL:baseURL];
        
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
        
    });
    
    return instance;
}

@end
