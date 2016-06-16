//
//  HMMainViewController.m
//  我的网易新闻
//
//  Created by Marcello on 16/6/14.
//  Copyright © 2016年 Marcello. All rights reserved.

//

#import "HMMainViewController.h"
#import "HMChannel.h"
#import "HMLable.h"

#import "HMHeadLineController.h"

#define screenW [UIScreen mainScreen].bounds.size.width

#define screenH [UIScreen mainScreen].bounds.size.height

#define channelViewH 44

@interface HMMainViewController ()

@property (nonatomic, strong) NSArray *channels;

@property (nonatomic, strong) UIScrollView *channelView;

@property (nonatomic, strong) UIScrollView *containtView;

@end

@implementation HMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    

   // NSLog(@"self.view.frame  =%@",NSStringFromCGRect(self.view.frame));

    self.channels = [HMChannel loadChannelData];
    
    [self.view addSubview:self.channelView];
    
    [self.view addSubview:self.containtView];
    
    [self setupChannelView];
    

    [self setupController];
    

    self.view.backgroundColor = [UIColor whiteColor];
    
}
/**
 *  设置子控制器
 */
- (void)setupController{
    
    HMHeadLineController *headLine = [[HMHeadLineController alloc] init];
    
    [self addChildViewController:headLine];
    
    [self.containtView addSubview:headLine.view];

}

- (void)setupChannelView{
    
    CGFloat lableX = 0;
    
    for (int i = 0; i < self.channels.count; ++i) {
        
        HMChannel *channel = self.channels[i];
        
        HMLable *lable = [HMLable initWithChannelText:channel.tname];
        
        lable.frame = CGRectMake(lableX, 0, lable.frame.size.width, lable.frame.size.height);
        
        lableX += lable.frame.size.width;
        
        [self.channelView addSubview:lable];
        
    }
    
    self.channelView.showsHorizontalScrollIndicator = NO;
    
    self.channelView.contentSize = CGSizeMake(lableX, 0);
    
}


#pragma mark - 懒加载
- (UIScrollView *)channelView{
    
    if (_channelView == nil) {
        
        _channelView = [[UIScrollView alloc] init];
        _channelView.backgroundColor = [UIColor redColor];
        
        _channelView.frame = CGRectMake(0, 64, screenW, channelViewH);
    }
    
    return _channelView;
}


- (UIScrollView *)containtView{
    
    if (_containtView == nil) {
        
        _containtView = [[UIScrollView alloc] init];
        
        _containtView.frame = CGRectMake(0, 108, screenW,screenH - 108 );
        
        _containtView.backgroundColor =[UIColor orangeColor];
    }
    
    return _containtView;
}



@end
