//
//  HMCollectionViewCell.m
//  我的网易新闻
//
//  Created by Marcello on 16/6/15.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import "HMCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@interface HMCollectionViewCell ()

/**
 *  图片
 */
@property (nonatomic, strong) UIImageView *icon;

@end

@implementation HMCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.icon = [[UIImageView alloc] init];
        
        [self addSubview:self.icon];
        
    }
    
    return self;
}

- (void)setUrl:(NSURL *)url{
    _url = url;
    
    [self.icon sd_setImageWithURL:self.url];
}


/**
 *  布局自主空间
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.icon.frame = self.bounds;
}
@end
