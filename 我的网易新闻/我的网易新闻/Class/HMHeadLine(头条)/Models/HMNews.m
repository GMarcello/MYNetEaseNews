//
//  HMNews.m
//  我的网易新闻
//
//  Created by Marcello on 16/6/15.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import "HMNews.h"

#import "HMNetworkTool.h"

@implementation HMNews

+ (instancetype)newsWithDict:(NSDictionary *)dict {
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

+ (void)newsLoadDataSucessWithURLString:(NSString *)URLString news:(void(^)(NSArray *news))sucess faild:(void(^)(NSError *error))failed{
    
    NSAssert(sucess != nil, @"不能为空..");
    
   // NSString *url = [NSString stringWithFormat:@""];
    
    [[HMNetworkTool sharedNetworkTool] GET:URLString  parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        
        //NSLog(@"responseObject = %@",responseObject);
        
        NSString *rootKey =  responseObject.keyEnumerator.nextObject;
        
        NSArray *loopArray = responseObject[rootKey];
        
        NSMutableArray *mtuNews = [NSMutableArray array];
        [loopArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            HMNews *news = [HMNews newsWithDict:obj];
            
            
            
            news.rowheight= [HMNews rowHeight:news];
            
            news.identifi = [HMNews identifierWithNew:news];
            
            [mtuNews addObject:news];
            
        }];
        
        sucess(mtuNews.copy);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failed) {
            
            failed (error);
        }
    }];
    
}
/**
 *  根据模型返回cell的高度
 */
+ (CGFloat)rowHeight:(HMNews *)news {
    if(news.imgextra) {
        return 120;
    } else if(news.imgType){
        return 150;
    }
    return 110;
}


/**
 *  根据模型返回cell的标识
 */
+ (NSString *)identifierWithNew:(HMNews *)news {
    if(news.imgextra) {
        return @"HMNewsCellThreeImage";
    } else if(news.imgType){
        return @"HMNewsBigImage";
    }
    return @"HMNewsCell";
}




@end
