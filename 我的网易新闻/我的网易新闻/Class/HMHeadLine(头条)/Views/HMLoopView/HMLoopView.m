//
//  HMLoopView.m
//  我的网易新闻
//
//  Created by Marcello on 16/6/15.
//  Copyright © 2016年 Marcello. All rights reserved.
//

#import "HMLoopView.h"
#import "HMCollectionViewFlowLayout.h"
#import "HMCollectionViewCell.h"


#define screnW [UIScreen mainScreen].bounds.size.width

@interface HMLoopView ()<UICollectionViewDelegate,UICollectionViewDataSource>

/**
 *  轮播图片
 */
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *urls;

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UIPageControl *pageControll;

@property (nonatomic, strong) UILabel *titleLable;

@end

@implementation HMLoopView

 - (instancetype)initWithloopViewWithURL:(NSArray <NSString *>*)URLS title:(NSArray <NSString *>* )titles{

     if (self = [self init]) {
         
         self.urls = URLS;
         
         self.titles = titles;
     }

    return self;
}

/**
 *  初始化
 *
 *  @param frame <#frame description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupLoopView];
    }
    return self;
}

/**
 *  初始化
 *
 *  @param aDecoder <#aDecoder description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        
        [self setupLoopView];
    }
    
    return self;
}





/**
 *  初始化loopView
 */
- (void)setupLoopView{

    /**
     *  添加图片
     */
    [self addSubview:self.collectionView];
    
    [self addSubview:self.titleLable];
    
    [self addSubview:self.pageControll];
    

    
    /**
     *  等到主线程空闲的时候才进来做里面的事情
     */
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.urls.count inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
            self.titleLable.text = self.titles[0];
            self.pageControll.numberOfPages = self.urls.count;
    
        
    });
    
}

#pragma mark  - collection的数据源方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
  
    NSUInteger count = self.urls.count > 1 ? self.urls.count *3: self.urls.count;
    
     // NSLog(@"self.urls.count = %zd",count);
    return count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"loop" forIndexPath:indexPath];

    cell.url = self.urls[indexPath.item% self.urls.count];
    
    return cell;
}

#pragma mark - collection的代理方法



-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGPoint offset = scrollView.contentOffset;
    
    CGFloat offsetX = offset.x ;
    
    NSUInteger page = offsetX/screnW;
    
    NSLog(@"%zd",page);
    
    //判断是否最后一张或者第一张
    if (page ==0 ||page ==[self.collectionView numberOfItemsInSection:0] -1) {
        
        page = (page == 0)? self.urls.count :self
        .urls.count-1;
        NSLog(@"-----page = %zd",page);
        scrollView.contentOffset = CGPointMake(page *screnW, 0);
    }
    
    self.pageControll.currentPage =page%self.urls.count;
    
    self.titleLable.text = self.titles[self.pageControll.currentPage];
    
    
    
}



#pragma mark - 懒加载加载collectionView

- (UICollectionView *)collectionView{
    
    if (_collectionView ==nil) {
        
        _collectionView  = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[HMCollectionViewFlowLayout alloc] init] ];
        
        //注册cell
        
        [_collectionView registerClass:[HMCollectionViewCell class] forCellWithReuseIdentifier:@"loop"];
        
        _collectionView.dataSource = self;
        
        _collectionView.delegate = self;
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:_collectionView];
        
         _collectionView.frame = self.frame;
    }
    
    return _collectionView;
}

- (UILabel*)titleLable{
    
    if (_titleLable ==nil) {
        
        _titleLable = [[UILabel alloc]init];
        _titleLable.textColor = [UIColor whiteColor];
        
        _titleLable.font = [UIFont systemFontOfSize:14];
    }
    
    return _titleLable;
}

- (UIPageControl *)pageControll{
    
    if (_pageControll ==nil) {
        
        _pageControll = [[UIPageControl alloc]  init];
        
        _pageControll.numberOfPages = self.urls.count;
        
       // _pageControll.backgroundColor = [UIColor orangeColor];
        _pageControll.currentPageIndicatorTintColor = [UIColor redColor];
        
        _pageControll.pageIndicatorTintColor = [UIColor blueColor];
    }
    
    return _pageControll;
}


- (void)layoutSubviews{

    
    CGFloat pageW = [self.pageControll sizeForNumberOfPages:self.urls.count].width;
    
    
    
    CGFloat titleH =30;
    
    CGFloat margain = 20;
    
    CGFloat titleY =self.frame.size.height - titleH;
    
    CGFloat titleX = margain;
    
    CGFloat titleW = screnW - margain*3 - pageW;
    
    self.titleLable.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat pageX = titleW+margain;
    CGFloat pageY = titleY;
    CGFloat pageH = titleH;
    
    self.pageControll.frame = CGRectMake(pageX, pageY, pageW, pageH);
    
    
    
    
}

@end
