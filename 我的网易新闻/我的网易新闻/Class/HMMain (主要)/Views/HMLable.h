//
//  HMLable.h
//  我的网易新闻
//
//  Created by Marcello on 16/6/14.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMChannel.h"

@interface HMLable : UILabel

@property (nonatomic, strong) HMChannel *channel;


+ (instancetype)initWithChannelText:(NSString *)text;

@end
