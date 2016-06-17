//
//  HMMainConllectionCell.h
//  我的网易新闻
//
//  Created by Marcello on 16/6/16.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMChannel;
@class HMHeadLineController;

@interface HMMainConllectionCell : UICollectionViewCell

@property (nonatomic, strong) HMChannel *channel;

@property (nonatomic, strong) HMHeadLineController *headLineController;

//+ (instancetype)mainCollectionCellWithCollectionView:(UICollectionView *)collection andIndexPath:(NSIndexPath *)indexPath;

@end
