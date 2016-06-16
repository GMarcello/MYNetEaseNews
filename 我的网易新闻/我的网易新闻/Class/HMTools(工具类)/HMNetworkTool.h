//
//  HMNetworkTool.h
//  我的网易新闻
//
//  Created by Marcello on 16/6/15.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface HMNetworkTool : AFHTTPSessionManager

+ (instancetype)sharedNetworkTool;


//- (void)loadNetworkData

@end
