//
//  ViewController.m
//  repositoryDemo
//
//  Created by zhangchao on 2017/8/16.
//  Copyright © 2017年 zhangchao. All rights reserved.
//

#import "ViewController.h"
#import "ZCBaseControl.h"
#import "TableView.h"
#import "ZCBaseView.h"

@interface ViewController ()<viewDelegate>
@property (nonatomic,strong) TableView *historyTB;
@property (nonatomic,strong) TableView *nowTB;
@property (nonatomic,strong) TableView *futureTB;
@property (nonatomic,strong) ZCBaseView *baseView;
@end


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.baseView];
    self.baseView.backgroundColor = [UIColor cyanColor];
    [self.baseView setButtonViewBackgroundColor:[UIColor cyanColor]];
    [self.baseView setAnimated:YES];
    
}

- (void)ShouldEnterDetailViewControllerWithItem:(id)item
{
    NSLog(@"点击了cell");
}

- (TableView *)historyTB
{
    if(_historyTB == nil)
    {
        _historyTB = [[TableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _historyTB.types = ShoppingTypeHistory;
        _historyTB.myDelegate = self;
    }
    return _historyTB;
}


- (TableView *)nowTB
{
    if(_nowTB == nil)
    {
        _nowTB = [[TableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _nowTB.types = ShoppingTypeQuoting;
        _nowTB.myDelegate = self;
    }
    return _nowTB;
}



- (TableView *)futureTB
{
    if(_futureTB == nil)
    {
        _futureTB = [[TableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _futureTB.types = ShoppingTypeFuture;
        _futureTB.myDelegate = self;
    }
    return _futureTB;
}


- (ZCBaseView *)baseView
{
    if(_baseView == nil)
    {
        _baseView = [[ZCBaseView alloc] initWithTitles:@[@"历史", @"现在",@"未来"] AndViews:@[self.historyTB,self.nowTB,self.futureTB] AtFrame:self.view.bounds];
    }
    return _baseView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
