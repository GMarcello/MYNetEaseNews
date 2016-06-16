//
//  HMHeadLineControllerViewController.m
//  我的网易新闻
//
//  Created by Marcello on 16/6/14.
//  Copyright © 2016年 Marcello. All rights reserved.

//

#import "HMHeadLineController.h"
#import "HMLoopView.h"
#import "HMNetworkTool.h"
#import "HMLoop.h"
#import "HMNewsCell.h"
#import "HMNews.h"

@interface HMHeadLineController ()

@property (nonatomic, strong) NSArray *loops;

@property (nonatomic, strong) NSArray *news;

@end

@implementation HMHeadLineController

- (void)viewDidLoad {
    [super viewDidLoad];


    [HMLoop loopLoadDataSucess:^(NSArray *loops) {
        
        self.loops = loops;

        [self setupHeadView];

        NSLog(@"%@", [NSThread currentThread]);
        
    } faild:^(NSError *error) {
        
    }];
    
    
    [HMNews newsLoadDataSucess:^(NSArray *news) {
        self.news = news;
        
        [self.tableView reloadData];
         //NSLog(@"---------%@",self.news);
    } faild:^(NSError *error) {
       
        
    }];
    
    
    

//    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 230)];
    

}

/**
 *  设置headView
 */
- (void)setupHeadView{
    
//     NSLog(@"222--------%@",self.loops);
    NSArray *urls = [self.loops valueForKeyPath:@"imgsrc"];
    
    NSArray *titles  = [self.loops valueForKeyPath:@"title"];
    
    HMLoopView *loopView = [[HMLoopView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];

    self.tableView.tableHeaderView =  [loopView initWithloopViewWithURL:urls title:titles];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HMNews *news = self.news[indexPath.row];
    HMNewsCell *cell = [HMNewsCell newsCellWithTableView:tableView identifi:news.identifi];
    
    cell.news = news;
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HMNews *news = self.news[indexPath.row];
    
    NSLog(@"row.height = %f",news.rowheight);
    
    return news.rowheight;
}

@end
