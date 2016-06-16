//
//  HMLoop.m
//  我的网易新闻
//
//  Created by Marcello on 16/6/15.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import "HMLoop.h"
#import "HMNetworkTool.h"

@implementation HMLoop

+ (instancetype)loopWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

/**
 *  防止key为空而出现的异常
 *
 *  @param value <#value description#>
 *  @param key   <#key description#>
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

+ (void)loopLoadDataSucess:(void(^)(NSArray *loops))sucess faild:(void(^)(NSError *error))failed{
    
    NSAssert(sucess != nil, @"不能为空..");
    
    [[HMNetworkTool sharedNetworkTool] GET:@"ad/headline/0-4.html"  parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        
        //NSLog(@"responseObject = %@",responseObject);
        
        NSString *rootKey =  responseObject.keyEnumerator.nextObject;
        
        NSArray *loopArray = responseObject[rootKey];
        
        NSMutableArray *mtuLoop = [NSMutableArray array];
        [loopArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            HMLoop *loop = [HMLoop loopWithDict:obj];
            
            [mtuLoop addObject:loop];
            
        }];

        sucess(mtuLoop.copy);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failed) {
            
            failed (error);
        }
    }];
    
}

@end
