//
//  HMNewsCell.h
//  我的网易新闻
//
//  Created by Marcello on 16/6/15.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMNews;

@interface HMNewsCell : UITableViewCell



@property (nonatomic, strong) HMNews *news;

+ (instancetype)newsCellWithTableView:(UITableView *)tableView identifi:(NSString *)identifi;

@end
