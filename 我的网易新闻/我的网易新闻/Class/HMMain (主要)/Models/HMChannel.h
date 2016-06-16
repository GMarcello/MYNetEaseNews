//
//  HMChannel.h
//  我的网易新闻
//
//  Created by Marcello on 16/6/14.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMChannel : NSObject

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, copy) NSString *tname;

+ (instancetype)channelWithDict:(NSDictionary *)dict;


+ (NSArray *)loadChannelData;

@end
