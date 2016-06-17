//
//  HMNews.h
//  我的网易新闻
//
//  Created by Marcello on 16/6/15.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMNews : NSObject

@property (nonatomic, copy) NSString *identifi;


/**
 *  新闻标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  新闻图片
 */
@property (nonatomic, copy) NSString *imgsrc;
/**
 *  新闻摘要
 */
@property (nonatomic, copy) NSString *digest;
/**
 *  跟帖数
 */
@property (nonatomic, copy) NSString *replyCount;

/**
 *  多图标记
 */
@property (nonatomic, strong) NSArray *imgextra;

/**
 *  大图标记
 */
@property (nonatomic, assign) BOOL imgType;

/**
 *  返回行高
 */
@property (nonatomic, assign) CGFloat rowheight;

+ (instancetype)newsWithDict:(NSDictionary *)dict;

+ (void)newsLoadDataSucessWithURLString:(NSString *)URLString news:(void(^)(NSArray *news))sucess faild:(void(^)(NSError *error))failed;

@end
