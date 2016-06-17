//
//  HMNewsCell.m
//  我的网易新闻
//
//  Created by Marcello on 16/6/15.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import "HMNewsCell.h"
#import "HMNews.h"
#import <UIButton+WebCache.h>
@interface HMNewsCell ()

@property (weak, nonatomic) IBOutlet UIButton *imageButton;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *digest;

@property (weak, nonatomic) IBOutlet UILabel *replyCountLable;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *imgextra;


@end

@implementation HMNewsCell

+ (instancetype)newsCellWithTableView:(UITableView *)tableView identifi:(NSString *)identifi{
    
    HMNewsCell *cell;
    
       cell = [tableView dequeueReusableCellWithIdentifier:identifi];
    
    if (cell ==nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:identifi owner:nil options:nil] lastObject];
    }

    return cell;
}


- (void)setNews:(HMNews *)news{
    _news = news;

    [self.imageButton sd_setBackgroundImageWithURL:[NSURL URLWithString:news.imgsrc] forState:UIControlStateNormal];


    self.title.text = news.title;
    self.digest.text = news.digest;
    self.replyCountLable.text = [NSString stringWithFormat:@"%@跟帖",news.replyCount];

    [news.imgextra enumerateObjectsUsingBlock:^(NSDictionary  *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        // 根据idx获得按钮
        UIButton *iconBtn = self.imgextra[idx];
        // 显示图片
        [iconBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:dict[@"imgsrc"]] forState:UIControlStateNormal];
    }];
    
}
@end
