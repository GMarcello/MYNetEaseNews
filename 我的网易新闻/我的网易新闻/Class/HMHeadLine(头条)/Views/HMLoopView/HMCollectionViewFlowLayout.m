//
//  HMCollectionViewFlowLayout.m
//  我的网易新闻
//
//  Created by Marcello on 16/6/15.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import "HMCollectionViewFlowLayout.h"

@implementation HMCollectionViewFlowLayout

- (void)prepareLayout{
    
    [super prepareLayout];
    
#warning 测试bounds和size的区别
    self.itemSize = self.collectionView.bounds.size;
    
    self.minimumLineSpacing = 0;
    
    self.minimumInteritemSpacing = 0;
    
    //滚动的方向
    self.scrollDirection =  UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.pagingEnabled = YES;
    
    self.collectionView.showsVerticalScrollIndicator = NO;
    
}


@end
