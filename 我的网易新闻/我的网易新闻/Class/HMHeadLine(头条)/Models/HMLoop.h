//
//  HMLoop.h
//  我的网易新闻
//
//  Created by Marcello on 16/6/15.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMLoop : NSObject

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, copy) NSString *title;

+ (instancetype)loopWithDict:(NSDictionary *)dict;

+ (void)loopLoadDataSucess:(void(^)(NSArray *loops))sucess faild:(void(^)(NSError *error))failed;

@end
