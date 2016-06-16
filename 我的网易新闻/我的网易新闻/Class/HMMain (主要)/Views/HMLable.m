//
//  HMLable.m
//  我的网易新闻
//
//  Created by Marcello on 16/6/14.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import "HMLable.h"
#define NormalFont 14

#define SelectFont 18

@implementation HMLable

 + (instancetype)initWithChannelText:(NSString *)text{
    
     HMLable *lable = [[self alloc] init ];
     
     lable.text = text;
     
     lable.font = [UIFont systemFontOfSize:SelectFont];
     
     [lable sizeToFit];
     
     lable.font = [UIFont systemFontOfSize:NormalFont];
     
     return lable;
    
}


@end
