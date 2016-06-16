//
//  HMChannel.m
//  我的网易新闻
//
//  Created by Marcello on 16/6/14.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import "HMChannel.h"

@implementation HMChannel

+ (instancetype)channelWithDict:(NSDictionary *)dict{
    HMChannel *channel = [[self alloc] init ];
    
    [channel setValuesForKeysWithDictionary:dict];
    
    return channel;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}


+ (NSArray *)loadChannelData{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_news" ofType:@"json"] ;
    
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    
    
    NSDictionary *dict =  [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:Nil];
    
    NSString *rootKey =  dict.keyEnumerator.nextObject;
    
    NSArray *channelArr = dict[rootKey];
    
    NSMutableArray *mtuChannel = [NSMutableArray array ];
    
    [channelArr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        HMChannel *channel = [HMChannel channelWithDict:obj];
        
        [mtuChannel addObject:channel];
        
        
    }];
    
    //排序

    return[mtuChannel sortedArrayUsingComparator:^NSComparisonResult(HMChannel* obj1, HMChannel* obj2) {
        
       
        //NSLog(@"---------------------%zd",[obj1.tid compare:obj2.tid]);
         return [obj1.tid compare:obj2.tid];
    }];

    
    
}

@end
