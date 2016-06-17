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
#import "HMMainConllectionCell.h"
#import "HMCollectionViewFlowLayout.h"

#import "HMNews.h"

#import "HMHeadLineController.h"

#define screenW [UIScreen mainScreen].bounds.size.width

#define screenH [UIScreen mainScreen].bounds.size.height

#define channelViewH 20

@interface HMMainViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *channels;

@property (nonatomic, strong) UIScrollView *channelView;

@property (nonatomic, strong) UICollectionView *containtView;

@property (nonatomic, strong) NSMutableDictionary  *headViewControllersCahe;

@property (nonatomic, strong) UILabel *selectedLable;

@end

@implementation HMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.channels = [HMChannel loadChannelData];
    
    [self.view addSubview:self.channelView];
    
    [self.view addSubview:self.containtView];
    
    [self setupChannelView];
    
    
}

/**
 *  设置频道的Lable
 */
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

/**
 *  根据模型的URL从缓存池中取出控制器
 *
 *  @param channel <#channel description#>
 *
 *  @return <#return value description#>
 */

- (HMHeadLineController *)headLineControllersWithNews:(HMChannel *)channel{
    
    HMHeadLineController *vc = self.headViewControllersCahe[channel.tid];
    
    if (vc ==nil) {
        vc  = [[HMHeadLineController alloc] init];
        vc.URLString = channel.URLString;
        [self.headViewControllersCahe setObject:vc forKey:channel.tid];
    }
    
    return vc;
    
}



#pragma mark - collectionViewd的方法


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.channels.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HMMainConllectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"main" forIndexPath:indexPath];
    
    cell.channel = self.channels[indexPath.item];
    
    [cell.headLineController.view removeFromSuperview];
    
    HMHeadLineController *headLineController= [self headLineControllersWithNews:cell.channel];
    
    if (![self.childViewControllers containsObject:headLineController]) {
        
        [self.view addSubview:headLineController.view];
    }
    
    cell.headLineController = headLineController;
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    self.selectedLable.textColor = [UIColor blackColor];
    CGPoint offset = scrollView.contentOffset;
    
    NSUInteger page = offset.x /screenW;
    
    HMLable *lable = self.channelView.subviews[page];
    
    lable.textColor = [UIColor greenColor];
    
    self.selectedLable = lable;
    NSLog(@"page = %zd",page);
}


#pragma mark - 懒加载

- (NSMutableDictionary *)headViewControllersCahe{
    
    if (_headViewControllersCahe ==nil) {
        
        _headViewControllersCahe = [NSMutableDictionary dictionaryWithCapacity:self.channels.count];
    }
    return _headViewControllersCahe;
}

#pragma mark - 懒加载
- (UIScrollView *)channelView{
    
    if (_channelView == nil) {
        
        _channelView = [[UIScrollView alloc] init];
        _channelView.backgroundColor = [UIColor redColor];
        
        _channelView.frame = CGRectMake(0, 0, screenW, channelViewH);
    }
    
    return _channelView;
}

/**
 *  collectionView懒加载
 *
 *  @return <#return value description#>
 */
- (UIScrollView *)containtView{
    
    if (_containtView == nil) {
        
        _containtView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[HMCollectionViewFlowLayout alloc] init]];
        
        _containtView.frame = CGRectMake(0, 20, screenW,screenH - 20 -64 );
        
        _containtView.dataSource =self;
        
        _containtView.delegate = self;
        
        //注册cell
        
        [_containtView registerClass:[HMMainConllectionCell class] forCellWithReuseIdentifier:@"main"];
        
        _containtView.backgroundColor =[UIColor orangeColor];
        
    }
    
    return _containtView;
}





@end
