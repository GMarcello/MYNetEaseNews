//
//  HMMainConllectionCell.m
//  我的网易新闻
//
//  Created by Marcello on 16/6/16.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import "HMMainConllectionCell.h"
#import "HMHeadLineController.h"
#import "HMChannel.h"

@interface HMMainConllectionCell ()



@end

@implementation HMMainConllectionCell


//+ (instancetype)mainCollectionCellWithCollectionView:(UICollectionView *)collection andIndexPath:(NSIndexPath *)indexPath{
//
//    HMMainConllectionCell *cell = [collection dequeueReusableCellWithReuseIdentifier:@"main" forIndexPath:indexPath];
//    
//    HMHeadLineController *headLine = [[HMHeadLineController alloc] init];
//    
//    cell.headLineController = headLine;
//
//    headLine.view.frame = CGRectMake(0, 0, cell.contentView.bounds.size.width, cell.contentView.bounds.size.height-64);
//    
//    NSLog(@"%lf",cell.contentView.bounds.size.height-64);
//    
//    [cell.contentView addSubview:headLine.view];
//    
//    
//    return cell;
//}




//-(void)setChannel:(HMChannel *)channel{
//    
//    _channel = channel;
//    
//   // NSLog(@"channel.Urlstring = %@",channel.URLString);
//    
//    self.headLineController.URLString= channel.URLString;
//    
//}

- (void)setHeadLineController:(HMHeadLineController *)headLineController{
    _headLineController = headLineController;
    
    [self.contentView addSubview:headLineController.view];
    [self setNeedsLayout];
}

/**
 *  布局子控件
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSLog(@"-------self.conlection.frame = %@",NSStringFromCGRect(self.contentView.frame));
    self.headLineController.view.frame = self.contentView.bounds;
    
}

@end
