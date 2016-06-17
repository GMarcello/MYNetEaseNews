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
     
     lable.userInteractionEnabled = YES;
     
     lable.font = [UIFont systemFontOfSize:SelectFont];
     
     [lable sizeToFit];
     
     lable.font = [UIFont systemFontOfSize:NormalFont];
     
     return lable;
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"text = %@",self.text);
}

//设置字体的大小和颜色

- (void)setScale:(CGFloat)scale{
    
    //计算最大缩放比例
    
    CGFloat maxScale = (CGFloat)(SelectFont - NormalFont)/NormalFont;
    
    //计算实际的缩放比例
    
    CGFloat realScale = maxScale *scale + 1;
    
    self.transform = CGAffineTransformMakeScale(realScale, realScale);
    
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1.0];
}


@end
